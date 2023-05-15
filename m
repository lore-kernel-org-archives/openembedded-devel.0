Return-Path: <alexander@amelkin.msk.ru>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D98F9C77B7D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 13:40:12 +0000 (UTC)
Received: from mail.fiord.ru (mail.fiord.ru [62.140.247.50])
 by mx.groups.io with SMTP id smtpd.web11.88451.1684158009238946876
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 06:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: amelkin.msk.ru, ip: 62.140.247.50, mailfrom: alexander@amelkin.msk.ru)
Received: from [::1] (helo=mail.fiord.ru)
	by mail.fiord.ru with esmtp (Exim 4.94.2)
	(envelope-from <alexander@amelkin.msk.ru>)
	id 1pyYQm-001Q7c-Hq
	for openembedded-devel@lists.openembedded.org; Mon, 15 May 2023 16:40:05 +0300
MIME-Version: 1.0
Date: Mon, 15 May 2023 16:40:04 +0300
From: Alexander Amelkin <alexander@amelkin.msk.ru>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] ipmitool: Update links
Message-ID: <4fc4e05da1303cbeceba45db400e31e9@amelkin.msk.ru>
X-Sender: alexander@amelkin.msk.ru
X-Remote-Browser: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36
 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.58
X-Originating-IP: [89.207.88.249]
X-RoundCube-Server: 62.140.247.50
Content-Type: multipart/mixed;
 boundary="=_8f5793998c36b9506bdf9eb062cdaf76"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 13:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102603

--=_8f5793998c36b9506bdf9eb062cdaf76
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed

The project has been moved to CodeBerg.org.
Update the links in the recipe and also bump to the
latest revision (1.8.19.13).

Additionally fix the link to the IANA PEN registry as IANA
has changed their URL scheme some time ago and the old link
started pointing to the HTML page instead of the text file.

Signed-off-by: Alexander Amelkin <alexander@amelkin.msk.ru>
---
  meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)


--=_8f5793998c36b9506bdf9eb062cdaf76
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; charset=us-ascii;
 name=0001-ipmitool-Update-links.patch
Content-Disposition: attachment;
 filename=0001-ipmitool-Update-links.patch;
 size=1635

ZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1rZXJuZWwvaXBtaXRvb2wvaXBtaXRvb2xfMS44
LjE5LmJiIGIvbWV0YS1vZS9yZWNpcGVzLWtlcm5lbC9pcG1pdG9vbC9pcG1pdG9vbF8xLjguMTku
YmINCmluZGV4IDAzNDA5MDFjMi4uYWI5MDc0YmJhIDEwMDY0NA0KLS0tIGEvbWV0YS1vZS9yZWNp
cGVzLWtlcm5lbC9pcG1pdG9vbC9pcG1pdG9vbF8xLjguMTkuYmINCisrKyBiL21ldGEtb2UvcmVj
aXBlcy1rZXJuZWwvaXBtaXRvb2wvaXBtaXRvb2xfMS44LjE5LmJiDQpAQCAtMTQsNyArMTQsNyBA
QCBMb2cgKFNFTCksIHByaW50aW5nIEZpZWxkIFJlcGxhY2VhYmxlIFVuaXQgKEZSVSkgaW5mb3Jt
YXRpb24sIHJlYWRpbmcgYW5kIFwNCiBzZXR0aW5nIExBTiBjb25maWd1cmF0aW9uLCBhbmQgY2hh
c3NpcyBwb3dlciBjb250cm9sLiBcDQogIg0KIA0KLUhPTUVQQUdFID0gImh0dHA6Ly9pcG1pdG9v
bC5zb3VyY2Vmb3JnZS5uZXQvIg0KK0hPTUVQQUdFID0gImh0dHA6Ly9jb2RlYmVyZy5vcmcvSVBN
SVRvb2wvaXBtaXRvb2wiDQogU0VDVElPTiA9ICJrZXJuZWwvdXNlcmxhbmQiDQogDQogTElDRU5T
RSA9ICJCU0QtMy1DbGF1c2UiDQpAQCAtMjIsMTQgKzIyLDE0IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PTlhYTkxZTEzZDY0NDMyNmJmMjgxOTI0MjEyODYyMTg0Ig0K
IA0KIERFUEVORFMgPSAib3BlbnNzbCByZWFkbGluZSBuY3Vyc2VzIg0KIFNSQ1JFViA9ICIxOWQ3
ODc4MmQ3OTVkMGNmNGNlZWZlNjU1ZjYxNjIxMGM5MTQzZTYyIg0KLVNSQ19VUkkgPSAiZ2l0Oi8v
Z2l0aHViLmNvbS9pcG1pdG9vbC9pcG1pdG9vbDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVy
IFwNCitTUkNfVVJJID0gImdpdDovL2NvZGViZXJnLm9yZy9pcG1pdG9vbC9pcG1pdG9vbDtwcm90
b2NvbD1odHRwczticmFuY2g9bWFzdGVyIFwNCiAgICAgICAgICAgICR7SUFOQV9FTlRFUlBSSVNF
X05VTUJFUlN9IFwNCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWNvbmZpZ3VyZS1SZW1vdmUtdGhl
LWxvZ2ljLXRvLWRvd25sb2FkLUlBTkEtUEVOLWRhdGEucGF0Y2ggXA0KICAgICAgICAgICAgIg0K
IElBTkFfRU5URVJQUklTRV9OVU1CRVJTID89ICIiDQogDQogIyBBZGQgdGhlc2UgdmlhIGJiYXBw
ZW5kIGlmIHRoaXMgZGF0YWJhc2UgaXMgbmVlZGVkIGJ5IHRoZSBzeXN0ZW0NCi0jSUFOQV9FTlRF
UlBSSVNFX05VTUJFUlMgPSAiaHR0cDovL3d3dy5pYW5hLm9yZy9hc3NpZ25tZW50cy9lbnRlcnBy
aXNlLW51bWJlcnM7bmFtZT1pYW5hLWVudGVycHJpc2UtbnVtYmVycztkb3dubG9hZGZpbGVuYW1l
PWlhbmEtZW50ZXJwcmlzZS1udW1iZXJzIg0KKyNJQU5BX0VOVEVSUFJJU0VfTlVNQkVSUyA9ICJo
dHRwOi8vd3d3LmlhbmEub3JnL2Fzc2lnbm1lbnRzL2VudGVycHJpc2UtbnVtYmVycy50eHQ7bmFt
ZT1pYW5hLWVudGVycHJpc2UtbnVtYmVycztkb3dubG9hZGZpbGVuYW1lPWlhbmEtZW50ZXJwcmlz
ZS1udW1iZXJzIg0KICNTUkNfVVJJW2lhbmEtZW50ZXJwcmlzZS1udW1iZXJzLnNoYTI1NnN1bV0g
PSAiY2RkOTdmYzA4MzI1NjY3NDM0YjgwNWViNTg5MTA0YWU2M2Y3YTllYjcyMGVjZWE3M2NiNTUx
MTBiMzgzOTM0YyINCiANCiBTID0gIiR7V09SS0RJUn0vZ2l0Ig0K
--=_8f5793998c36b9506bdf9eb062cdaf76--

