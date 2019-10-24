Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id D320E7F99B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 09:34:38 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9O9VBCY022689 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-id
	: content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=8ffH5lAFnyhm+1QCGEiyO0DqCClI6aT1+e3/Wz8EWJk=;
	b=pzXvIqWjnAPGwy5ZTWS9eD0lV3DyWxlVt9EAks4lG3yzLN+TGuzb06guWWsGaJWH3HUL
	tvFPbzjgm/BJzyEXNRFTmpbwOaKbXOzSw6UL8Yqjd6rhRVnSLDsHZA4r1wyokUSipJzD
	B0VNVksOqhVh61QYC626H6SstPcW0fOPVcrXZ/TRxa2X4ddMxLSJShTsD9Oo8CSs97L9
	SPxc5JaQah6aIr1dfM99HANPodxa5kLRZ2aXIRnxMcuUA9yyC13PWTfdvzo3LbUEUoQ2
	2PJt4ONJrEXwZVWRJqCqwfcLbdtxRi+Xv/NnuAWorOg4C95tCqOKOoW5JCoMSaCRrzwS
	WA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s78sgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 02BC710002A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F03E221F170
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:38 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 24 Oct 2019 11:34:38 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 11:34:38 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 07/10] Python: passlib: Clarify BSD license
	variant
Thread-Index: AQHVik5BYUZz1afPF0iKkVSwCf+Z8w==
Date: Thu, 24 Oct 2019 09:34:38 +0000
Message-ID: <20191024093428.4538-7-christophe.priouzeau@st.com>
References: <20191024093428.4538-1-christophe.priouzeau@st.com>
In-Reply-To: <20191024093428.4538-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-24_06:2019-10-23,2019-10-24 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-python][PATCH 07/10] Python: passlib: Clarify BSD license variant
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
X-List-Received-Date: Thu, 24 Oct 2019 09:34:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD5EE7E973D7C74FB1B2E38976B16FC6@st.com>
Content-Transfer-Encoding: base64

VGhlIExpY2Vuc2Ugb2YgcHl0aG9uIHBhc3NsaWIgaXMgQlNELTMtQ2xhdXNlLg0KDQpTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RvcGhlIFByaW91emVhdSA8Y2hyaXN0b3BoZS5wcmlvdXplYXVAc3QuY29t
Pg0KLS0tDQogbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLXBhc3Ns
aWIuaW5jIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQ0KDQpkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uLXBhc3NsaWIuaW5jIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uLXBhc3NsaWIuaW5jDQppbmRleCA5ZTQ3N2VjZjkuLjhhNmQ3ZTliMiAxMDA2NDQNCi0t
LSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1wYXNzbGliLmlu
Yw0KKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLXBhc3Ns
aWIuaW5jDQpAQCAtNiw3ICs2LDcgQEAgbWFuYWdpbmcgZXhpc3RpbmcgcGFzc3dvcmQgaGFzaGVz
LiBJdOKAmXMgZGVzaWduZWQgdG8gYmUgdXNlZnVsIGZvciBhIHdpZGUgcmFuZ2UNCiB0YXNrcywg
ZnJvbSB2ZXJpZnlpbmcgYSBoYXNoIGZvdW5kIGluIC9ldGMvc2hhZG93LCB0byBwcm92aWRpbmcg
ZnVsbC1zdHJlbmd0aCBwYXNzd29yZCBcDQogaGFzaGluZyBmb3IgbXVsdGktdXNlciBhcHBsaWNh
dGlvbnMuIg0KIEhPTUVQQUdFID0gImh0dHBzOi8vYml0YnVja2V0Lm9yZy9lY29sbGlucy9wYXNz
bGliIg0KLUxJQ0VOU0UgPSAiQlNEIg0KK0xJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIg0KIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTczZWVkMWE1NDcwYjk2OTk1MWRhYzQx
MTA4NmM3MDM2Ig0KIA0KIFNSQ19VUklbbWQ1c3VtXSA9ICIyNTQ4NjlkYWUzZmQ5ZjA5ZjA3NDZh
M2NiMjlhMGIxNSINCi0tIA0KMi4xNy4xDQo=

