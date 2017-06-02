Return-Path: <ulf.hofemeier@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9C1FD77F98
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 19:56:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2017 12:56:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,286,1493708400"; 
	d="scan'208,217";a="864021432"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Jun 2017 12:56:27 -0700
Received: from orsmsx114.amr.corp.intel.com (10.22.240.10) by
	ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Fri, 2 Jun 2017 12:56:27 -0700
Received: from orsmsx115.amr.corp.intel.com ([169.254.4.151]) by
	ORSMSX114.amr.corp.intel.com ([169.254.8.165]) with mapi id
	14.03.0319.002; Fri, 2 Jun 2017 12:56:27 -0700
From: "Hofemeier, Ulf" <ulf.hofemeier@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: PATCH] Update quagga to version 1.2.1
Thread-Index: AQHS29pR8D/13JRocUqPhqSvmZ/eHw==
Date: Fri, 2 Jun 2017 19:56:26 +0000
Message-ID: <6D1DB749-93AC-4C31-A185-6D906C42F4B6@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/f.21.0.170409
x-originating-ip: [10.241.226.35]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: PATCH] Update quagga to version 1.2.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Jun 2017 19:56:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCkhlcmXigJlzIGEgcmVjaXBlIHRvIHVwZGF0ZSBxdWFnZ2EgaW4gT0UgbWV0YS1uZXR3
b3JraW5nIHRvIHRoZSBsYXRlc3QgdmVyc2lvbi4NCg0KU3ViamVjdDogW1BBVENIXSBVcGRhdGVk
IHF1YWdnYSB0byB2ZXJzaW9uIDEuMi4xLiBBZGRlZCBjLWFyZXMgZGVwZW5kZW5jeSBhcw0KIHRo
aXMgaXMgbm93IG5lZWRlZCBieSBidWlsZCB0aW1lIGNvbmZpZ3VyZSBzZXR1cC4NCg0KU2lnbmVk
LW9mZi1ieTogVWxmIEhvZmVtZWllciA8dWxmLmhvZmVtZWllckBpbnRlbC5jb20+DQotLS0NCiBt
ZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1wcm90b2NvbHMvcXVhZ2dhL3F1YWdnYS5pbmMgICAgICB8
IDIgKy0NCiBtZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1wcm90b2NvbHMvcXVhZ2dhL3F1YWdnYV8x
LjEuMC5iYiB8IDYgLS0tLS0tDQogbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtcHJvdG9jb2xzL3F1
YWdnYS9xdWFnZ2FfMS4yLjEuYmIgfCA2ICsrKysrKw0KIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhLW5ldHdv
cmtpbmcvcmVjaXBlcy1wcm90b2NvbHMvcXVhZ2dhL3F1YWdnYV8xLjEuMC5iYg0KIGNyZWF0ZSBt
b2RlIDEwMDY0NCBtZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1wcm90b2NvbHMvcXVhZ2dhL3F1YWdn
YV8xLjIuMS5iYg0KDQpkaWZmIC0tZ2l0IGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtcHJvdG9j
b2xzL3F1YWdnYS9xdWFnZ2EuaW5jIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtcHJvdG9jb2xz
L3F1YWdnYS9xdWFnZ2EuaW5jDQppbmRleCA0ZmI2NzIzLi45NjQwNTEzIDEwMDY0NA0KLS0tIGEv
bWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtcHJvdG9jb2xzL3F1YWdnYS9xdWFnZ2EuaW5jDQorKysg
Yi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1wcm90b2NvbHMvcXVhZ2dhL3F1YWdnYS5pbmMNCkBA
IC04LDcgKzgsNyBAQCBhcm91bmQgUXVhZ2dhIHRoYW4gdGhlIGN1cnJlbnQgY2VudHJhbGlzZWQg
bW9kZWwgb2YgR05VIFplYnJhLiINCiBIT01FUEFHRSA9ICJodHRwOi8vd3d3Lm5vbmdudS5vcmcv
cXVhZ2dhLyINCiBTRUNUSU9OID0gIm5ldCINCiBMSUNFTlNFID0gIkdQTC0yLjAgJiBMR1BMLTIu
MCINCi1ERVBFTkRTID0gInJlYWRsaW5lIG5jdXJzZXMgcGVybC1uYXRpdmUiDQorREVQRU5EUyA9
ICJyZWFkbGluZSBuY3Vyc2VzIHBlcmwtbmF0aXZlIGMtYXJlcyINCiBERVBFTkRTICs9ICIke0Bi
Yi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3NubXAnLCAnbmV0LXNubXAnLCAn
JywgZCl9Ig0KIFNOTVBfQ09ORj0iJHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJF
UycsICdzbm1wJywgJy0tZW5hYmxlLXNubXAnLCAnJywgZCl9Ig0KDQpkaWZmIC0tZ2l0IGEvbWV0
YS1uZXR3b3JraW5nL3JlY2lwZXMtcHJvdG9jb2xzL3F1YWdnYS9xdWFnZ2FfMS4xLjAuYmIgYi9t
ZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1wcm90b2NvbHMvcXVhZ2dhL3F1YWdnYV8xLjEuMC5iYg0K
ZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAxYjVjMzRjLi4wMDAwMDAwDQotLS0gYS9t
ZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1wcm90b2NvbHMvcXVhZ2dhL3F1YWdnYV8xLjEuMC5iYg0K
KysrIC9kZXYvbnVsbA0KQEAgLTEsNiArMCwwIEBADQotcmVxdWlyZSBxdWFnZ2EuaW5jDQotDQot
U1JDX1VSSVttZDVzdW1dID0gImRhYTMwMzg3MWUwN2VhNTg1NmFhZTZmZDc5ZTg5NzIyIg0KLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJmN2E0M2E5YzU5YmZkMzcyMjAwMjIxMDUzMGIyNTUzYzhkNWNj
MDViZmVhNWFjZDU2ZDRmMTAyYjlmNTVkYzYzIg0KLQ0KLVFVQUdHQVNVQkRJUiA9ICIiDQpkaWZm
IC0tZ2l0IGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtcHJvdG9jb2xzL3F1YWdnYS9xdWFnZ2Ff
MS4yLjEuYmIgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1wcm90b2NvbHMvcXVhZ2dhL3F1YWdn
YV8xLjIuMS5iYg0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAuLjM3NTg5NmIN
Ci0tLSAvZGV2L251bGwNCisrKyBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXByb3RvY29scy9x
dWFnZ2EvcXVhZ2dhXzEuMi4xLmJiDQpAQCAtMCwwICsxLDYgQEANCityZXF1aXJlIHF1YWdnYS5p
bmMNCisNCitTUkNfVVJJW21kNXN1bV0gPSAiYjE1NDZkZTg5MDYyZjcwNzBkNTZlNzgwYjMwYmU0
YjEiDQorU1JDX1VSSVtzaGEyNTZzdW1dID0gImFhZGRiYTVkNGY0MWVkOGU0YzJmMTU1ZjQ1ODRj
OTkzNDY1ZDEyMmM5MDk2YjViNTJhZGEzZmM3NTI2NmZiY2QiDQorDQorUVVBR0dBU1VCRElSID0g
IiINCi0tDQoyLjcuNA0KDQo=

