unit AT.SplashSvr.IPCUtils;

interface

uses
  Winapi.Windows, Winapi.Messages;

const
  cMemMapNameFmt = '%s.Msgs';

type
  TMemMapBuffer = record
    Value: array [ 0 .. 8192 ] of char;
  end;

  PMemMapBuffer = ^TMemMapBuffer;

procedure InitWindowMessages( const AAppID: string );

var
  G_WM_SetSplashFormHandle: Cardinal;
  G_WM_SplashClose: Cardinal;
  G_WM_SplashHide: Cardinal;
  G_WM_SplashSetStartMsg: Cardinal;
  G_WM_SplashShow: Cardinal;

implementation

uses
  System.SysUtils;

function RegisterWinMessage( const AAppID, AMsgSuffix: string )
  : Cardinal;
begin

  var
  AMsgName := Format( 'WM_%s_%s', [ AAppID, AMsgSuffix ] );

  Result := RegisterWindowMessage( PWideChar( AMsgName ) );

end;

procedure InitWindowMessages( const AAppID: string );
begin

  G_WM_SetSplashFormHandle := RegisterWinMessage( AAppID,
    'SETSPLASHFORMHANDLE' );

  G_WM_SplashClose := RegisterWinMessage( AAppID, 'CLOSE' );

  G_WM_SplashHide := RegisterWinMessage( AAppID, 'HIDE' );

  G_WM_SplashSetStartMsg := RegisterWinMessage( AAppID,
    'SETSTARTMSG' );

  G_WM_SplashShow := RegisterWinMessage( AAppID, 'SHOW' );

end;

end.
