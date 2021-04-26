unit AT.SplashSvr.DEB.Events;

interface

type
  IEvtSplashClose = interface
  ['{3D4D1422-09A1-4481-8B50-3E39CA878D84}']
  end;

  IEvtSplashHide = interface
  ['{644C3F64-F517-487F-AEFD-9C3CD655A802}']
  end;

  IEvtSplashSetStartMsg = interface
  ['{C4BCD44B-D93F-494D-B957-8EE9F8BCC0A7}']
    function GetMessage: string;
    procedure SetMessage(const Value: string);
    property Message: string read GetMessage write SetMessage;
  end;

  IEvtSplashShow = interface
  ['{24D1E769-55A7-4F77-A1E7-B70BCD35E919}']
  end;

  TSplashEventPost = class( TObject )
  public
    class function CreateSplashCloseEvent: IEvtSplashClose;
    class function CreateSplashHideEvent: IEvtSplashHide;
    class function CreateSplashSetStartMsgEvent(const AMessage: string): IEvtSplashSetStartMsg;
    class function CreateSplashShowEvent: IEvtSplashShow;
    class procedure SplashClose;
    class procedure SplashHide;
    class procedure SplashSetStartMsg(const AMessage: string);
    class procedure SplashShow;
  end;


implementation

uses
  EventBus;



type
  TEvtSplashClose = class(TInterfacedObject, IEvtSplashClose)
  end;

  TEvtSplashHide = class(TInterfacedObject, IEvtSplashHide)
  end;

  TEvtSplashSetStartMsg = class(TInterfacedObject, IEvtSplashSetStartMsg)
  strict private
    FMessage: string;
  strict protected
    function GetMessage: string;
    procedure SetMessage(const Value: string);
  public
    property Message: string read GetMessage write SetMessage;
  end;

  TEvtSplashShow = class(TInterfacedObject, IEvtSplashShow)
  end;



function TEvtSplashSetStartMsg.GetMessage: string;
begin
  Result := FMessage;
end;

procedure TEvtSplashSetStartMsg.SetMessage(const Value: string);
begin
  FMessage := Value;
end;



{ TSplashEventPost }

class function TSplashEventPost.CreateSplashCloseEvent: IEvtSplashClose;
begin

  Result := TEvtSplashClose.Create;

end;

class function TSplashEventPost.CreateSplashHideEvent: IEvtSplashHide;
begin

  Result := TEvtSplashHide.Create;

end;

class function TSplashEventPost.CreateSplashSetStartMsgEvent(
  const AMessage: string): IEvtSplashSetStartMsg;
begin

  Result := TEvtSplashSetStartMsg.Create;

  Result.Message := AMessage;

end;

class function TSplashEventPost.CreateSplashShowEvent: IEvtSplashShow;
begin

  Result := TEvtSplashShow.Create;

end;

class procedure TSplashEventPost.SplashClose;
begin

  var AEvent := CreateSplashCloseEvent;

  GlobalEventBus.Post( AEvent );

end;

class procedure TSplashEventPost.SplashHide;
begin

  var AEvent := CreateSplashHideEvent;

  GlobalEventBus.Post( AEvent );

end;

class procedure TSplashEventPost.SplashSetStartMsg(
  const AMessage: string);
begin

  var AEvent := CreateSplashSetStartMsgEvent(AMessage);

  GlobalEventBus.Post( AEvent );

end;

class procedure TSplashEventPost.SplashShow;
begin

  var AEvent := CreateSplashShowEvent;

  GlobalEventBus.Post( AEvent );

end;

end.
