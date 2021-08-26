Subject: [meta-python][RFC] python3-kivy
To: openembedded-devel@lists.openembedded.org
From: "William Huang" <whuang8933@gmail.com>
X-Originating-Location: Woodbridge, Ontario, CA (97.108.30.204)
X-Originating-Platform: Mac Chrome 92
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 25 Aug 2021 20:04:49 -0700
Message-ID: <YPWj.1629947089031625845.Nxxr@lists.openembedded.org>
X-Groupsio-MsgNum: 92748
Content-Type: multipart/mixed; boundary="b43PzPZpfheTwFheuV7Z"

--b43PzPZpfheTwFheuV7Z
Content-Type: multipart/alternative; boundary="HsSIGwChO3lQR1bvc0ma"

--HsSIGwChO3lQR1bvc0ma
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,
I would like to request for comments on a Kivy recipe. Not sure how I shoul=
d include the recipe but I added it as an attachment for now. I've also inc=
luded a recipe that installs example programs into /usr/share/kivy-examples=
/examples.

I managed to get it running on a Rockchip rk3399 in a X environment, as wel=
l as on a imx8 in a Wayland environment, although I did need to reconfigure=
 libsdl2 to use GLES libraries and remove X11 package in the case of the im=
x8.

Any feedback would be great! Not sure if the recipe would be good enough to=
 be included in the meta-python layer as well.

Thanks,
William Huang

--HsSIGwChO3lQR1bvc0ma
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,<br />I would like to request for comments on a Kivy recipe. Not sure=
 how I should include the recipe but I added it as an attachment for now. I=
've also included a recipe that installs example programs into /usr/share/k=
ivy-examples/examples.&nbsp;<br /><br />I managed to get it running on a Ro=
ckchip rk3399 in a X environment, as well as on a imx8 in a Wayland environ=
ment, although I did need to reconfigure libsdl2 to use GLES libraries and =
remove X11 package in the case of the imx8.<br /><br />Any feedback would b=
e great! Not sure if the recipe would be good enough to be included in the =
meta-python layer as well.<br /><br />Thanks,<br />William Huang

--HsSIGwChO3lQR1bvc0ma--

--b43PzPZpfheTwFheuV7Z
Content-Type: application/octet-stream; name="python3-kivy_2.0.0.bb"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="python3-kivy_2.0.0.bb"

U1VNTUFSWSA9ICJSZWNpcGllIHRvIGVtYmVkZGVkIHRoZSBQeXRob24gUGlQIFBhY2thZ2UgS2l2
eSIKSE9NRVBBR0UgPSAiaHR0cHM6Ly9raXZ5Lm9yZy8iCkxJQ0VOU0UgPSAiTUlUIgoKTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZjBjODUxZDYwNDk1YzdlMjcyMjVhODE5
ZTE3OTIwOGEiCgppbmhlcml0IHNldHVwdG9vbHMzCgpTUkNfVVJJID0gIlwKICAgIGdpdDovL2dp
dGh1Yi5jb20va2l2eS9raXZ5LmdpdDtwcm90b2NvbD1naXQ7XAogICAgIgoKIyBLaXZ5J3Mgc2V0
dXAgZmlsZXMgb25seSBsb29rIGZvciBHTEVTIGxpYnJhcmllcyBmb3IgYW5kcm9pZCwgaU9zLCBS
YXNwYmVycnkgUGksIGFuZCBtYWxpLWJhc2VkIE9TJ3MKIyBXZSBuZWVkIHRvIHBhdGNoIHRoZSBz
ZXR1cCBmaWxlIHRvIHRlbGwgS2l2eSBzZXR1cCB0aGF0IG91ciBtYWNoaW5lIGhhcyBHTEVTIGxp
YmFyaWVzIGluc3RhbGxlZCBhcyB3ZWxsClNSQ19VUkkgKz0gIiBcCiAgICBmaWxlOi8vMDAwMS1h
ZGQtc3VwcG9ydC1mb3ItZ2xlc3YyLnBhdGNoIFwKIgpTUkNSRVYgPSAiZGVkY2I2YmNhYmUzZDhk
Njc1OGRjZWU2MDdlOGMzM2IxNzRkNzgyYiIKClMgPSAiJHtXT1JLRElSfS9naXQiCgpVU0VfV0FZ
TEFORCA9ICIke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3dheWxhbmQn
LCAnMScsICcwJywgZCl9IgpleHBvcnQgVVNFX1dBWUxBTkQKCiMgaWYgdXNpbmcgV2F5bGFuZCwg
bGV0J3MgdXNlIHB1cmUgV2F5bGFuZCAoYW5kIG5vdCBYV2F5bGFuZCkKIyBzbyBkbyBub3QgYnVp
bGQgdXNpbmcgWDExIGZsYWcgd2hlbiB3ZSBkZXRlY3QgV2F5bGFuZApVU0VfWDExID0gIiBcCiAg
ICAke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3dheWxhbmQnLCAgJzAn
LCBcCiAgICAgICBiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3gxMScsICAg
ICAgJzEnLCBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgJzAnLCBkKSwgZCl9IgpleHBvcnQgVVNFX1gxMQoKIyBVc2UgT3BlbkdMIEVTIDIu
MCBsaWJyYXJ5CktJVllfR1JBUEhJQ1MgPSAiZ2xlcyIKZXhwb3J0IEtJVllfR1JBUEhJQ1MKCktJ
VllfQ1JPU1NfU1lTUk9PVD0iJHtXT1JLRElSfS9yZWNpcGUtc3lzcm9vdCIKZXhwb3J0IEtJVllf
Q1JPU1NfU1lTUk9PVAoKREVQRU5EUyArPSAiIFwKICAgIGdzdHJlYW1lcjEuMCBcCiAgICBnc3Ry
ZWFtZXIxLjAtcHl0aG9uIFwKICAgIGxpYnNkbDIgXAogICAgbGlic2RsMi10dGYgXAogICAgbGli
c2RsMi1pbWFnZSBcCiAgICBsaWJzZGwyLW1peGVyIFwKICAgIHBhbmdvIFwKICAgIHB5dGhvbjMg
XAogICAgcHl0aG9uMy1jeXRob24tbmF0aXZlIFwKIgoKUkRFUEVORFNfJHtQTn0gPSAiIFwKICAg
IGdzdHJlYW1lcjEuMCBcCiAgICBnc3RyZWFtZXIxLjAtcHl0aG9uIFwKICAgIGxpYnNkbDIgXAog
ICAgbGlic2RsMi10dGYgXAogICAgbGlic2RsMi1pbWFnZSBcCiAgICBsaWJzZGwyLW1peGVyIFwK
ICAgIHBhbmdvIFwKICAgIHB5dGhvbjMgXAogICAgcHl0aG9uMy1kb2N1dGlscyBcCiAgICBweXRo
b24zLWZjbnRsIFwKICAgIHB5dGhvbjMtaW1hZ2UgXAogICAgcHl0aG9uMy1waWxsb3cgXAogICAg
cHl0aG9uMy1weWdtZW50cyBcCiIKCiMgcmVtb3ZlIGtpdnktZXhhbXBsZXMKZG9faW5zdGFsbF9h
cHBlbmQoKSB7CiAgICBybSAtcmYgJHtEfS91c3Ivc2hhcmUKfQo=

--b43PzPZpfheTwFheuV7Z
Content-Type: application/octet-stream; name="kivy-examples_2.0.0.bb"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="kivy-examples_2.0.0.bb"

U1VNTUFSWSA9ICJSZWNpcGllIHRvIGVtYmVkZGVkIHRoZSBQeXRob24gUGlQIFBhY2thZ2UgS2l2
eSIKSE9NRVBBR0UgPSAiaHR0cHM6Ly9raXZ5Lm9yZy8iCkxJQ0VOU0UgPSAiTUlUIgoKTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZjBjODUxZDYwNDk1YzdlMjcyMjVhODE5
ZTE3OTIwOGEiCgpTUkNfVVJJID0gIlwKICAgIGdpdDovL2dpdGh1Yi5jb20va2l2eS9raXZ5Lmdp
dDtwcm90b2NvbD1naXQ7XAogICAgIgpTUkNSRVYgPSAiZGVkY2I2YmNhYmUzZDhkNjc1OGRjZWU2
MDdlOGMzM2IxNzRkNzgyYiIKClMgPSAiJHtXT1JLRElSfS9naXQiCgoKZG9fY29tcGlsZSgpIHsK
fQoKZG9fY29uZmlndXJlKCkgewp9Cgpkb19pbnN0YWxsKCkgewogICAgaW5zdGFsbCAtZCAke0R9
L3Vzci9zaGFyZS9raXZ5LWV4YW1wbGVzCiAgICBjcCAtciAke1N9L2V4YW1wbGVzICR7RH0vdXNy
L3NoYXJlL2tpdnktZXhhbXBsZXMKfQoKRklMRVNfJHtQTn0gKz0gIiR7U30vZXhhbXBsZXMiCg==

--b43PzPZpfheTwFheuV7Z--
