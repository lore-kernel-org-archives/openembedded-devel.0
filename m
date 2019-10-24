Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id B8C9C7F99A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 15:07:45 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9OF1XxE018027 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-id
	: content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=u++hF0LgkBN1YdWCHTzvAglmhKV6s54KH7K5ba4j9A0=;
	b=jLYO6292+xlmoXYxWRFbPayBdWRuG+YL/1rWyBsg5+maRFEXeWoHgySsUVvbfkTdyWcs
	3jNMbDNLtFH4U7GdLJH4w9GT0t/A0zt9kjKJ4NZDNE4EjQL6dk+YERES9Voqkj7duyJF
	SOHlJDCL2dYNyDXf+vPRLfWDGKXiY/1ZLvuNrRUuYqRm3F3UTuiA8rz6a7sixOS0Pw1b
	1JmvvMrZgPFz1pMnB7EOCayqYX8D6y+3fQrpaqDMfg0Hb9uQF8ZrZkoKCqTmxsX16QrB
	B0rZ3SofxSofgVsl6yyHnpFunygAYu27keLwNYB1abyj55+7QAQWOaEYXCW588Pts4gl
	uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s1th8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1CF77100034
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1764A2C38D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:46 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 24 Oct 2019 17:07:45 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 17:07:45 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 7/9] Python: flask: Clarify BSD license
	variant
Thread-Index: AQHVinzK3DMXNTNS50evHCG5NN46EA==
Date: Thu, 24 Oct 2019 15:07:45 +0000
Message-ID: <20191024150740.22983-7-christophe.priouzeau@st.com>
References: <20191024150740.22983-1-christophe.priouzeau@st.com>
In-Reply-To: <20191024150740.22983-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-24_09:2019-10-23,2019-10-24 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-python][PATCH 7/9] Python: flask: Clarify BSD license variant
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
X-List-Received-Date: Thu, 24 Oct 2019 15:07:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <08EFB1E3F2C6EA4EBCB7F9EEFF884CCF@st.com>
Content-Transfer-Encoding: base64

VGhlIExpY2Vuc2Ugb2YgcHl0aG9uIGZsYXNrIGlzIEJTRC0zLUNsYXVzZS4NCg0KU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0b3BoZSBQcmlvdXplYXUgPGNocmlzdG9waGUucHJpb3V6ZWF1QHN0LmNvbT4N
Ci0tLQ0KIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1mbGFzay5p
bmMgfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
DQoNCmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24tZmxhc2suaW5jIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
LWZsYXNrLmluYw0KaW5kZXggZmZkNzgzZjNkLi4xMGRjYTQzYmIgMTAwNjQ0DQotLS0gYS9tZXRh
LXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tZmxhc2suaW5jDQorKysgYi9t
ZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tZmxhc2suaW5jDQpAQCAt
Myw3ICszLDcgQEAgREVTQ1JJUFRJT04gPSAiXA0KIEZsYXNrIGlzIGEgbWljcm9mcmFtZXdvcmsg
Zm9yIFB5dGhvbiBiYXNlZCBvbiBXZXJremV1ZywgSmluamEgMiBhbmQgZ29vZCBcDQogaW50ZW50
aW9ucy4gQW5kIGJlZm9yZSB5b3UgYXNrOiBJdOKAmXMgQlNEIGxpY2Vuc2VkISINCiBIT01FUEFH
RSA9ICJodHRwczovL2dpdGh1Yi5jb20vbWl0c3VoaWtvL2ZsYXNrLyINCi1MSUNFTlNFID0gIkJT
RCINCitMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSINCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT1jMDExODgzYWMyNjIyOWI4YmEzMDg0ZjU1Yzc2NjRjNiINCiANCiBTUkNf
VVJJW21kNXN1bV0gPSAiODI0ZjBmMjBhYWUxZjQ0YzljN2RjNDA1NGFkYjc5NjkiDQotLSANCjIu
MTcuMQ0K

