Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 82C3C7CD42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 15:07:45 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9OF1XZh002571 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-id
	: content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=mb9skrVPIDsfaVcVGLFRVM80PatzHuS2ztxVsAS6syM=;
	b=yb1ZTMolzol1yLErgVMAGpV2rIdA/ZrDZNZItAshMqeaAxYOv6MuergmrWUSXfdixwhP
	S+Zr6qY8eyVyze+8fcBd1cNnYjCq1gHSww8ZUB9qbonCdp0MTKNUxmxRRPr4AhAs3nDG
	x6Pm7Wt07+DQCYCBqy49pHlSNk7hwBmYsoGjKvt28xY6+nfMwwgB8K662RpRV3YCFAZO
	5a9AQoFBEjWlumllWacCnF3MmQPicYteclHhcD/mob/XeC82BzPjpYIk5R3ItwQDopd1
	cD/7lUihBr8P85v2QVPSGTDy6p8jJ7o5wF3HysbMQmEtxxaC/OkLr9q6D58bnymHSdKB
	7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s4ahc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A14D510002A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 97C9D2C38D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:45 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 24 Oct 2019 17:07:44 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 17:07:44 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 6/9] Python: pika: Clarify BSD license
	variant
Thread-Index: AQHVinzKJsewgFp/u0CJAyRWFp3VvQ==
Date: Thu, 24 Oct 2019 15:07:44 +0000
Message-ID: <20191024150740.22983-6-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 6/9] Python: pika: Clarify BSD license variant
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
X-List-Received-Date: Thu, 24 Oct 2019 15:07:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6B9F951BC31E347827FF9287031158F@st.com>
Content-Transfer-Encoding: base64

VGhlIExpY2Vuc2Ugb2YgcHl0aG9uIHBpa2EgaXMgQlNELTMtQ2xhdXNlLg0KDQpTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RvcGhlIFByaW91emVhdSA8Y2hyaXN0b3BoZS5wcmlvdXplYXVAc3QuY29tPg0K
LS0tDQogbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLXBpa2EuaW5j
IHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0K
DQpkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
LXBpa2EuaW5jIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLXBp
a2EuaW5jDQppbmRleCAxMGJlNWJiNjIuLmJkZTE1NGZlNyAxMDA2NDQNCi0tLSBhL21ldGEtcHl0
aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1waWthLmluYw0KKysrIGIvbWV0YS1w
eXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLXBpa2EuaW5jDQpAQCAtNSw3ICs1
LDcgQEAgaW5jbHVkaW5nIFJhYmJpdE1R4oCZcyBleHRlbnNpb25zLiBcDQogIg0KIFNFQ1RJT04g
PSAiZGV2ZWwvcHl0aG9uIg0KIEhPTUVQQUdFID0gImh0dHBzOi8vcGlrYS5yZWFkdGhlZG9jcy5p
byINCi1MSUNFTlNFID0gIkJTRCINCitMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSINCiBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT01MzU4MzZiZjBhNWRlNTE1YTdiZmVlMDI2
MDc1NzAxZCINCiANCiBTUkNfVVJJW21kNXN1bV0gPSAiNjAwMjQwMGNkZDMzYmY4NWVjODY4MGVj
ZTcyOTEwZDQiDQotLSANCjIuMTcuMQ0K

