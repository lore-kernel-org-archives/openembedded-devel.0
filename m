Received: from infosrv.imms.de ([194.95.250.51])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thomas.elste@imms.de>) id 1OR5W4-0001Cs-NS
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 17:36:21 +0200
Received: from infosrv.imms.de (infosrv.imms.de [127.0.0.1])
	by IMSA (Postfix) with ESMTP id 66AB4260053
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 17:31:25 +0200 (CEST)
Received: from proxy.imms.de (proxy.imms.de [194.95.250.53])
	by infosrv.imms.de (Postfix) with ESMTP id 4CD8726004A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 17:31:25 +0200 (CEST)
Received: from pluto ([172.16.10.24])
	by proxy.imms.de (8.13.8+Sun/8.13.8) with ESMTP id o5MFVYFK005537
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 17:31:34 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <1277204396-12287-1-git-send-email-thomas.elste@imms.de>
	<hvqh9b$hqo$1@dough.gmane.org>
Date: Tue, 22 Jun 2010 17:31:19 +0200
MIME-Version: 1.0
From: "Thomas Elste" <thomas.elste@imms.de>
Organization: IMMS gGmbH
Message-ID: <op.vepj2hhaaqzt3c@pluto>
In-Reply-To: <hvqh9b$hqo$1@dough.gmane.org>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 194.95.250.51
X-SA-Exim-Mail-From: thomas.elste@imms.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qwt: Add version 5.2.1
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
X-List-Received-Date: Tue, 22 Jun 2010 15:36:41 -0000
X-Groupsio-MsgNum: 20360
Content-Type: multipart/mixed; boundary=----------sO1kSlf1sIDYHy8vH410oR

------------sO1kSlf1sIDYHy8vH410oR
Content-Type: text/plain; charset=iso-8859-15; format=flowed; delsp=yes
Content-Transfer-Encoding: quoted-printable

Hi,

> Could you make the -e and regular variants parallel installable? The
> demos could be put in ${D}${bindir}/qwt-examples${QWT_VARIANT} for exam=
ple.
No problem for the examples. I've changed this in the attached patch.
But I don't know, if there's a clean way to install the library itself
for both variants.

Best regards
Thomas

------------sO1kSlf1sIDYHy8vH410oR
Content-Disposition: attachment; filename=0001-qwt-Add-version-5.2.1.patch
Content-Type: application/octet-stream; name=0001-qwt-Add-version-5.2.1.patch
Content-Transfer-Encoding: Base64

RnJvbSBlYWQ2ZDAzYTg2ODExMmFhMTcxMjZkYWVjYmIzODk5ZTAzNzZkNGNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgRWxzdGUgPHRob21hcy5lbHN0ZUBpbW1zLmRlPgpE
YXRlOiBNb24sIDIxIEp1biAyMDEwIDE2OjU3OjQ0ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gcXd0
OiBBZGQgdmVyc2lvbiA1LjIuMQoKQWRkIHJlY2lwZSBmb3IgY3VycmVudCB2ZXJzaW9uIG9mIFF3
dC4gVGhpcyBuZXcgdmVyc2lvbiB1c2VzIHF0NC1jbGFzc2VzCmluc3RlYWQgb2YgcGFsbXRvcC4g
RGlmZmVyZW50IGJiLWZpbGVzIGZvciBRdCBhbmQgUXQtRW1iZWRkZWQKdmFyaWFudCBhcmUgcHJv
dmlkZWQuIFF3dCBleGFtcGxlcyBhcmUgYWxzbyBidWlsZC4gVGhleSBnZXQgZGVwbG95ZWQgaW4K
ZXh0cmEgcGFja2FnZXMuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgRWxzdGUgPHRob21hcy5lbHN0
ZUBpbW1zLmRlPgotLS0KIHJlY2lwZXMvcXd0L3F3dC1lXzUuMi4xLmJiIHwgICAgOCArKysrKysr
KwogcmVjaXBlcy9xd3QvcXd0LmluYyAgICAgICAgfCAgIDM1ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiByZWNpcGVzL3F3dC9xd3RfNS4yLjEuYmIgICB8ICAgIDggKysrKysr
KysKIDMgZmlsZXMgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCByZWNpcGVzL3F3dC9xd3QtZV81LjIuMS5iYgogY3JlYXRlIG1vZGUg
MTAwNjQ0IHJlY2lwZXMvcXd0L3F3dC5pbmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCByZWNpcGVzL3F3
dC9xd3RfNS4yLjEuYmIKCmRpZmYgLS1naXQgYS9yZWNpcGVzL3F3dC9xd3QtZV81LjIuMS5iYiBi
L3JlY2lwZXMvcXd0L3F3dC1lXzUuMi4xLmJiCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAuLjA5YjMxZWQKLS0tIC9kZXYvbnVsbAorKysgYi9yZWNpcGVzL3F3dC9xd3QtZV81LjIu
MS5iYgpAQCAtMCwwICsxLDggQEAKK1FXVF9WQVJJQU5UID0gImUiCityZXF1aXJlIHF3dC5pbmMK
KworUFIgPSAiJHtJTkNfUFJ9LjEiCisKK1NSQ19VUklbbWQ1c3VtXSA9ICI0YTU5NWI4ZGIwZWMz
ODU2YjExNzgzNmMxZDYwY2IyNyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlMmI4YmI3NTU0MDRj
YjNkYzk5ZTYxZjNlMmQ3MjYyMTUyMTkzNDg4ZjVmYmU4ODUyNGViNjk4ZTExYWM1NjlmIgorCmRp
ZmYgLS1naXQgYS9yZWNpcGVzL3F3dC9xd3QuaW5jIGIvcmVjaXBlcy9xd3QvcXd0LmluYwpuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi41ZmZmNzlkCi0tLSAvZGV2L251bGwKKysr
IGIvcmVjaXBlcy9xd3QvcXd0LmluYwpAQCAtMCwwICsxLDM1IEBACitERVNDUklQVElPTiA9ICJR
dCBXaWRnZXQgRXh0ZW5zaW9uIGZvciBUZWNobmljYWwgQXBwbGljYXRpb25zIgorSE9NRVBBR0Ug
PSAiaHR0cDovL3F3dC5zb3VyY2Vmb3JnZS5uZXQvIgorU0VDVElPTiA9ICJsaWJzIgorUFJJT1JJ
VFkgPSAib3B0aW9uYWwiCitMSUNFTlNFID0gIkdQTCIKK0lOQ19QUiA9ICJyMCIKKworU1JDX1VS
SSA9ICIke1NPVVJDRUZPUkdFX01JUlJPUn0vcXd0L3F3dC0ke1BWfS50YXIuYnoyIgorCitpbmhl
cml0IHF0NCR7UVdUX1ZBUklBTlR9CisKK1MgPSAiJHtXT1JLRElSfS9xd3QtJHtQVn0iCisKK0VY
VFJBX09FTUFLRSA9ICIke1BBUkFMTEVMX01BS0V9IgorCitkb19jb25maWd1cmVfcHJlcGVuZCgp
IHsKKyAgICAgICAgIyBzZXQgaW5zdGFsbCBwYXRoIGFuZCBkb2MgcGF0aCwgZW5hYmxlIGV4YW1w
bGVzCisgICAgICAgIHNlZCAtaSBcCisgICAgICAgICAgICAgICAgLWUgJ3MvXChJTlNUQUxMQkFT
RSAqPSBcKVwvdXNyLiovXDFcL3Vzci8nIFwKKyAgICAgICAgICAgICAgICAtZSAncy9cKGRvYy5w
YXRoLipcL1wpLiovXDFzaGFyZVwvZG9jXC9xd3QtJHtQVn0vJyBcCisgICAgICAgICAgICAgICAg
LWUgJ3MvI0NPTkZJRyAgICAgKz0gUXd0RXhhbXBsZXMvQ09ORklHICs9IFF3dEV4YW1wbGVzLycg
XAorICAgICAgICAgICAgICAgIHF3dGNvbmZpZy5wcmkKK30KKworZG9faW5zdGFsbCgpIHsKKyAg
ICAgICAgb2VfcnVubWFrZSBpbnN0YWxsIElOU1RBTExfUk9PVD0ke0R9CisgICAgICAgIGluc3Rh
bGwgLWQgJHtEfSR7YmluZGlyfS9xd3QtZXhhbXBsZXMtJHtRV1RfVkFSSUFOVH0KKyAgICAgICAg
aW5zdGFsbCBleGFtcGxlcy9iaW4vKiAke0R9JHtiaW5kaXJ9L3F3dC1leGFtcGxlcy0ke1FXVF9W
QVJJQU5UfQorfQorCitQQUNLQUdFUyA9KyAiJHtQTn0tZXhhbXBsZXMgJHtQTn0tZXhhbXBsZXMt
ZGJnIgorRklMRVNfJHtQTn0gPSAiJHtsaWJkaXJ9LyoiCitGSUxFU18ke1BOfS1leGFtcGxlcyA9
ICIke2JpbmRpcn0vcXd0LWV4YW1wbGVzLSR7UVdUX1ZBUklBTlR9LyoiCitGSUxFU18ke1BOfS1l
eGFtcGxlcy1kYmcgPSAiJHtiaW5kaXJ9L3F3dC1leGFtcGxlcy0ke1FXVF9WQVJJQU5UfSIKKwpk
aWZmIC0tZ2l0IGEvcmVjaXBlcy9xd3QvcXd0XzUuMi4xLmJiIGIvcmVjaXBlcy9xd3QvcXd0XzUu
Mi4xLmJiCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmExMTQyZjAKLS0tIC9k
ZXYvbnVsbAorKysgYi9yZWNpcGVzL3F3dC9xd3RfNS4yLjEuYmIKQEAgLTAsMCArMSw4IEBACitR
V1RfVkFSSUFOVCA9ICJ4MTEiCityZXF1aXJlIHF3dC5pbmMKKworUFIgPSAiJHtJTkNfUFJ9LjEi
CisKK1NSQ19VUklbbWQ1c3VtXSA9ICI0YTU5NWI4ZGIwZWMzODU2YjExNzgzNmMxZDYwY2IyNyIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlMmI4YmI3NTU0MDRjYjNkYzk5ZTYxZjNlMmQ3MjYyMTUy
MTkzNDg4ZjVmYmU4ODUyNGViNjk4ZTExYWM1NjlmIgorCi0tIAoxLjcuMQoK

------------sO1kSlf1sIDYHy8vH410oR--
