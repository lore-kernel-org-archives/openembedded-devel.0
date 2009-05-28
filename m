Received: from [128.222.32.20] (helo=mexforward.lss.emc.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Lin_Lynn@emc.com>) id 1M9Ufg-0008EP-3B
	for openembedded-devel@openembedded.org; Thu, 28 May 2009 03:44:40 +0200
Received: from hop04-l1d11-si01.isus.emc.com (HOP04-L1D11-SI01.isus.emc.com
	[10.254.111.54])
	by mexforward.lss.emc.com (Switch-3.2.5/Switch-3.1.7) with ESMTP id
	n4S1aMIh004554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 27 May 2009 21:36:22 -0400 (EDT)
From: Lin_Lynn@emc.com
Received: from mailhub.lss.emc.com (numailhub.lss.emc.com [10.254.144.16]) by
	hop04-l1d11-si01.isus.emc.com (Tablus Interceptor) for
	<openembedded-devel@openembedded.org>;
	Wed, 27 May 2009 21:36:12 -0400
Received: from corpussmtp2.corp.emc.com (corpussmtp2.corp.emc.com
	[128.221.14.146])
	by mailhub.lss.emc.com (Switch-3.3.2/Switch-3.3.2) with ESMTP id
	n4S1aCTu032542 for <openembedded-devel@openembedded.org>;
	Wed, 27 May 2009 21:36:12 -0400
Received: from CORPUSMX100C.corp.emc.com ([128.222.76.50]) by
	corpussmtp2.corp.emc.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 27 May 2009 21:36:12 -0400
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 27 May 2009 21:35:59 -0400
Message-ID: <065E68EB87448440A3E75B4DBB5E871C45A406@CORPUSMX100C.corp.emc.com>
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
Thread-Topic: [oe][patch] remove dirty .swp file
Thread-Index: AcnfNKcDMgUHdJORSoSGQiemsaD8vg==
To: <openembedded-devel@openembedded.org>
X-OriginalArrivalTime: 28 May 2009 01:36:12.0142 (UTC)
	FILETIME=[AED778E0:01C9DF34]
X-EMM-EM: Active
Subject: [patch] remove dirty .swp file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 May 2009 01:44:40 -0000
X-Groupsio-MsgNum: 10792
Content-class: urn:content-classes:message
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C9DF34.AED8657A"

------_=_NextPart_001_01C9DF34.AED8657A
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


In mini-httpd package,there is a dirty .swp file.the patch is to remove
this file
 <<0001-remove-dirty-.swp-file.patch>>=20

Lynn Lin


------_=_NextPart_001_01C9DF34.AED8657A
Content-Type: application/octet-stream;
	name="0001-remove-dirty-.swp-file.patch"
Content-Transfer-Encoding: base64
Content-Description: 0001-remove-dirty-.swp-file.patch
Content-Disposition: attachment;
	filename="0001-remove-dirty-.swp-file.patch"

RnJvbSBlZmMyNWI1MmFjN2RiNzBmYzRjYzg1YTA2Mzg3MjEwMTVjMThjZDExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMeW5uIExpbiA8TGluX0x5bm5AZW1jLmNvbT4KRGF0ZTogVGh1
LCAyOCBNYXkgMjAwOSAwOToyMjoyOCArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIHJlbW92ZSBkaXJ0
eSAuc3dwIGZpbGUKCi0tLQogcmVjaXBlcy9taW5pLWh0dHBkLy5taW5pLWh0dHBkXzEuMTkuYmIu
c3dwIHwgIEJpbiAxMjI4OCAtPiAwIGJ5dGVzCiAxIGZpbGVzIGNoYW5nZWQsIDAgaW5zZXJ0aW9u
cygrKSwgMCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCByZWNpcGVzL21pbmktaHR0
cGQvLm1pbmktaHR0cGRfMS4xOS5iYi5zd3AKCmRpZmYgLS1naXQgYS9yZWNpcGVzL21pbmktaHR0
cGQvLm1pbmktaHR0cGRfMS4xOS5iYi5zd3AgYi9yZWNpcGVzL21pbmktaHR0cGQvLm1pbmktaHR0
cGRfMS4xOS5iYi5zd3AKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGQzODQ1NzcxMjQw
OTE1Y2NlZjIwYmU1MWY4MDExYzc1MDE0MmEzNDUuLjAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAKR0lUIGJpbmFyeSBwYXRjaApsaXRlcmFsIDAKSGNtVj9kMDAwMDEKCmxp
dGVyYWwgMTIyODgKemNtZUkyT15AM3w3e3tOJlgkOT84QVImJHFabHY4ayNMZ30lWkdsQ2tQU2pk
JHZYLTU7RHlrR3M7entEaEZPZmFqCnooMXlTajJgKyNUZDt2Wk1GWEYteCZSaT9MMTZPIylQOERs
ZWItNjtIa15iPyNKb0JISy07NTdkWDMpNm5ibnVGSwp6MEYqOFF7UTEjMCZNIX0xZ3hBe3UoQFo/
bilufSMwRzZ+aD50U0Vxd3dWfTAwdiNGSXpFMWsoaSNzZTd5R08lVzEKekkyQmA9VFhDMyNeQCZv
bXBweHpIb0JQK3khUWt2NklEIWM8Znp0QGcpdT97O0ppS3xaLV9Yc01qNXFNclNNSG5eCnokI3FQ
QzJgflhCenl6Mjg2SlA+TmZDPkNoMzg+alFfPU1LPiFnX3RSXzRDfGA9ZW8hYkNjcCVrMDI1I1dP
bj9iNgp6MFZjbyVtO2UpQzAhLWpQTkkoUHQrYjtvcFB0eVBZS21HcHlic09NdyhyMlc1cX1ORWxV
alg9eF5leVJBKHVic2cKel5hMUhVPT5xQUdeOGkxU3o5VzUyYGpZZW9ESUB0TGtKS1BwQiRJVEp2
YHpaIVdxPkU3QTRwJTN4K0VhfHhTcmNqCnpkVlpYazAyNSNXT24/YjYwVmNvJW44NVEoVTxGJkw+
fVReTjdFXzVrKlBVKzVAZVhVdCl+ZEc1MlZvTH4qPWglTwp6ST9ZT2JFWXtVd2t9REJLdShpJSRK
O3VoQiVhXmdYeW0jYz9CQnhkNTA8SmtzbE15dSkpe2s7cygoV2ZDcDZOeXgKemQofGx4eTRveCtg
fVRgX3paSHw8bD0jZ0I7V0drRDw3V3Aha29LUGYqeGtiPUskdUtxTWlVaXRtOHZ3MmEtN2NzCnpw
PTNROW4pSW16SnwzY1JmPkFsfGRUcl82VF5Sc1EqWGpBVD1lV0pUK3dfezlxRHZyMFZqaWo3czVX
PC1vd29NVgp6WWJzNXNgPDRNKUkwX15Bd3ErSH05JkV+KyNne3UkWTA2fXI5P1FDSW49XyQ/bFhy
XlchK29yVEJ5diROJnFjakYKejJtYzg1Si1kSSRhfUV1PzZFeXh9dWB0Q2ptTlomeTw+XlEqTD8o
K31GUTsze21kaUpsJGp0RiQ4V21obUZEK3tyCnomfXpId1ptWW5jRk1hMkVXUHNuY2QoS2Y7aGFe
JU5hTkR1bFVCOTRsLUVTRmleUWhCeW4+VUp6ZT4paXN1MXVTcAp6cWlgcV42ajdleUslemRtO2Rx
fE8wOUFAWGlvU29feTRtWndLR0tfa2ooaHg7U3MqS1lzQ085OEF7b20+PHp5MH0Kem5uKWFvSlJJ
VWszUG5hYXJYJVckKzV+ZiU5bXxYaVRKNz0jdGUzZGlVPH1Del5IX1VUeTY4ZFM1XyZSe0JCI21D
CnpsWW81bVU+JkUyUTgqLVE1X2ZZYyhMUXFUSktZPG1aV3lJeWtkaiVQP34jRj4mS19tcWMlcEZF
LW90fU47fkwoWQpiJFFWOEc1WnxUU192VnlKP35oezxNck45Zy0tRXZhUCRgXm8KCi0tIAoxLjUu
NC4zCgo=

------_=_NextPart_001_01C9DF34.AED8657A--
