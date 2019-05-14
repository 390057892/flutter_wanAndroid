class BaseResp<T> {
  String status;
  int errorCode;
  String errorMsg;
  T data;

  BaseResp(this.status, this.errorCode, this.errorMsg, this.data);

  @override
  String toString() {
    return 'BaseResp{status: $status, errorCode: $errorCode, errorMsg: $errorMsg, data: $data}';
  }
}
