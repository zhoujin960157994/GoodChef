//
//  Common.h
//  payDemo
//
//  Created by gorson on 4/26/15.
//  Copyright (c) 2015 1000phone. All rights reserved.
//

#ifndef payDemo_Common_h
#define payDemo_Common_h

/*
 * 支付宝的宏定义
 * 商户的唯一的parnter和seller。
 * 签约后，支付宝会为每个商户分配一个唯一的 parnter 和 seller。
 */
/*需要填写商户app申请的*/
#define KAlipayPartnerID  @"2088511933544308"
#define KAlipaySellerAccount  @"yingtehua8@sina.com"
#define KAlipayPrivateKey @"MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAL0M8jaJCm9bMb7PjgI0wR9+mpzWTcNTwTyYBEXmrJg3MjRVluUezDjQhQBSrgaMTeM40cz+1Nt/f1OlS/vB9PzGSF+MDty6zS0NQEEvVjUUge7PsOtbPDIEmuPppKIj4wETfavaZt7j4/kVuABDC2P1DpPRP686dJsNTkSO5qrNAgMBAAECgYApxEVy9P3gMkagQFzAcgVEvwTLp7EQeV2U1IUFKHxzOKaX11z6C77UwoTP2HRoL/E5RSFc5+QBBn8L7NYHrgdAu4L5Kl048saM53QyXJviQs7lgxDSBbo+EHDY9OJJsVRalpqKSirgBZmce/M4/tNhDxUfV5yXvxOC43JEr92UIQJBAPXbahDDMN+D0MqG1y0zPyU5bJwopXsSLIxpqp4vRmHokMxlber5HGMgSSnVQ9x9j974G1RSamqV34xwnqPzIlUCQQDE2ZPgtKd9Te19kGpmmCs64iqlkUVabAuKI8wMyx4hGZx6/EpeufFiTpF3F3YDN37JOenBefLL9UIkrOrjXI6ZAkBmpX75FKV5DG3FwNph0r2QaxM/d3DvmzziOtOzS4WVJyYdUFO+ANerQzWIs7OrgPjqXKf8YpRvf7dfyT1SshYpAkAhj0qDw6jOVwvHHWjWZtjv6AEHSxX8zXDGM0YlZDeVww0Hdp2jOqYpcWWhXRGUiNCHs+TjREwdc4m8QPKmom/5AkAYGRw6TLB/XWfEvlGLMHMmbZWMXDBdBmlIN+JK2oRjIoTryG35KlXzAHWcAq2xVhvCd6gJjz9arUmqewOLBMWn"

/**
 *  微信支付的宏定义
 */
//商户号
#define KWechatPARTNER_ID    @"1900000109"
//商户密钥
#define KWechatPARTNER_KEY   @"8934e7d15453e97507ef794cf7b0519d"
//APPID (微信支付入驻成功后，微信后台返回的回调(URL Schemes ))
#define KWechatAPPI_ID       @"wxd930ea5d5a258f4f"
//appsecret
#define KWechatAPP_SECRET	@"db426a9829e4b49a0dcac7b4162da6b6"
//支付密钥
#define KWechatAPP_KEY       @"L8LrMqqeGRxST5reouB0K66CaYAWpqhAVsq7ggKkxHCOastWksvuX1uvmvQclxaHoYd3ElNBrNO2DHnnzgfVG9Qs473M3DTOZug5er46FhuGofumV8H2FVR9qkjSlC5K"

#endif
