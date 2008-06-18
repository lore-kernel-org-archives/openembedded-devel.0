Received: from [66.249.92.171] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lvcargnini@gmail.com>) id 1K90yg-0000AY-C1
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jun 2008 18:57:46 +0200
Received: by ug-out-1314.google.com with SMTP id c2so1137625ugf.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2008 09:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:reply-to
	:to:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=Ll80m+pcgn0k8pUPUIO/mBhAUgOLVBTVwy1/HMfndyo=;
	b=G1Zy19i1/8AQbZ7U31x2mdc58+o98+vB1okyiaHv0FFGf7VG+umrkeNovAoplNVL1/
	voGsCIsup/LT+VrRmSYwfEq5ZKSX6Da/FtjF1HDDj8g2K3z4v3BZnAp3NJQ7tKs0tevg
	58n9MatkeUJ70lLycLOcQ3rtoa4HDSnCoWwHQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:to:subject:cc:in-reply-to
	:mime-version:content-type:content-transfer-encoding
	:content-disposition:references;
	b=ut81OkwvqaA7FjErgfRrNX0g7Mq2I634R+gWM7amkEDEBwUx5On5ca1ENEBEIy34uC
	Nc97Zwums0CddNHRVjGTzVtBfrinrAt2Q0uY2hmZ/bLAK4QRc5R7tBCDiiDn5gCtnZU6
	kyyaQiKpLMC5UQ0oYYAHlhX5acSybUp4I+ZTA=
Received: by 10.210.51.10 with SMTP id y10mr788075eby.93.1213808205829;
	Wed, 18 Jun 2008 09:56:45 -0700 (PDT)
Received: by 10.210.24.18 with HTTP; Wed, 18 Jun 2008 09:56:45 -0700 (PDT)
Message-ID: <ae36f8040806180956r7143e0eelc1adbf65112d9a3c@mail.gmail.com>
Date: Wed, 18 Jun 2008 13:56:45 -0300
From: "=?UTF-8?Q?Lu=C3=ADs_Vit=C3=B3rio_Cargnini?=" <lvcargnini@gmail.com>
To: angstrom-distro-devel@linuxtogo.org
In-Reply-To: <200806181725.49146.mickey@vanille-media.de>
MIME-Version: 1.0
References: <ae36f8040806180812j37bca53lf1e06722a8246a55@mail.gmail.com>
	<200806181725.49146.mickey@vanille-media.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Angstrom-devel] problems with bitbake
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 18 Jun 2008 16:57:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Content-Disposition: inline

SSBkaWQgYXMgeW91IHNhaWQsIEkgZmluZGVkIHRoZSBlcnJvciBpbiBleHByZXNzaW9uIHJlZ3Vs
YXIsIHRoZSBlcnJvcgp3YXMgaW4gQkJGSUxFUyBJIGZpeGVkIGl0CmJ1dCB0aGUgZXJyb3Igbm93
IGlzOgoKCmx2Y2FyZ25pbmlAcHJvdGhldXM6fi9pbnN0cmFtZWQvb3BlbmVtYmVkZGVkJCBiaXRi
YWtlIG5hbm8KRVJST1I6ICBPcGVuZW1iZWRkZWQncyBjb25maWcgc2FuaXR5IGNoZWNrZXIgZGV0
ZWN0ZWQgYSBwb3RlbnRpYWwKbWlzY29uZmlndXJhdGlvbi4KCUVpdGhlciBmaXggdGhlIGNhdXNl
IG9mIHRoaXMgZXJyb3Igb3IgYXQgeW91ciBvd24gcmlzayBkaXNhYmxlIHRoZQpjaGVja2VyIChz
ZWUgc2FuaXR5LmNvbmYpLgoJRm9sbG93aW5nIGlzIHRoZSBsaXN0IG9mIHBvdGVudGlhbCBwcm9i
bGVtcyAvIGFkdmlzb3JpZXM6CgoJUGxlYXNlIHNldCBUQVJHRVRfQVJDSCBkaXJlY3RseSwgb3Ig
Y2hvb3NlIGEgTUFDSElORSBvciBESVNUUk8gdGhhdCBkb2VzIHNvLgpQbGVhc2Ugc2V0IFRBUkdF
VF9PUyBkaXJlY3RseSwgb3IgY2hvb3NlIGEgTUFDSElORSBvciBESVNUUk8gdGhhdCBkb2VzIHNv
LgpESVNUUk8gJ05vbmUnIG5vdCBmb3VuZC4gUGxlYXNlIHNldCBhIHZhbGlkIERJU1RSTyBpbiB5
b3VyIGxvY2FsLmNvbmYKCgpPbiBXZWQsIEp1biAxOCwgMjAwOCBhdCAxMjoyNSBQTSwgTWljaGFl
bCAnTWlja2V5JyBMYXVlcgo8bWlja2V5QHZhbmlsbGUtbWVkaWEuZGU+IHdyb3RlOgo+IEFtIE1p
dHR3b2NoIDE4IEp1bmkgMjAwOCAxNzoxMjo1MyBzY2hyaWViIEx1w61zIFZpdMOzcmlvIENhcmdu
aW5pOgo+PiBEZWFyIGZlbGxvd3M6Cj4+Cj4+IEknbSByZXN0YXJ0aW5nIHRoZSBkZXZlbG9wbWVu
dCBwcm9jZXNzIGJhc2VkIG9uIG9wZW5lbWJlZGRlZCB3aXRoCj4+IGFuZ3N0cm9tIGRpc3Rybywg
YWZ0ZXIgcmVjb25maWd1cmluZyBhIG5ldyBtYWNoaW5lICh1YnVudHUgOC4wNCkgdG8KPj4gd29y
ayBwcm9wZXJseSBJIGRpZCB0aGUgZm9sbG93aW5nOgo+PiBiaXRiYWtlIGJhc2UtaW1hZ2UgOyBi
aXRiYWtlIGNvbnNvbGUtaW1hZ2UgOyBiaXRiYWtlIHgxMS1pbWFnZQo+Pgo+PiBhbmQgZ2V0IHRo
ZSBmb2xsb3dpbmcgZXJyb3JzOgo+Pgo+PiBFUlJPUjogbm8gZmlsZXMgdG8gYnVpbGQuCj4KPiBU
aGlzIGFsbW9zdCBhbHdheXMgaXMgYSBwcm9ibGVtIG9mIEJCRklMRVMgb3IgQkJQQVRIIHNldHRp
bmdzLiBTaW5jZSB5b3VyCj4gQkJGSUxFUyBzZWVtcyB0byBiZSBzZXQgKGRvdWJsZSBjaGVjayB3
aGV0aGVyIHRoZSByZWdleCBpcyB2YWxpZCksIGRvdWJsZQo+IGNoZWNrIHdoZXRoZXIgQkJQQVRI
IHBvaW50cyB0byB0aGUgcHJvcGVyIGRpcmVjdG9yaWVzLCBzbyB0aGF0IEJpdGJha2UKPiBhY3R1
YWxseSBoYXMgYSBjaGFuY2UgdG8gZmluZCB5b3VyIGxvY2FsLmNvbmYgYW5kIGl0cyBiaXRiYWtl
LmNvbmYuCj4KPiAtLQo+IDpNOgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBBbmdzdHJvbS1kaXN0cm8tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gQW5n
c3Ryb20tZGlzdHJvLWRldmVsQGxpbnV4dG9nby5vcmcKPiBodHRwOi8vbGlzdHMubGludXh0b2dv
Lm9yZy9jZ2ktYmluL21haWxtYW4vbGlzdGluZm8vYW5nc3Ryb20tZGlzdHJvLWRldmVsCj4KCgoK
LS0gCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpUaGFua3MgJiYgUmVnYXJkcwpNLlNjLiBCLlNjLiBM
dcOtcyBWaXTDs3JpbyBDYXJnbmluaQpJRUVFIE1lbWJlcgpFbGVjdHJpY2FsIEVuZ2luZWVyIEZh
Y3VsdHkgQCBQVUNSUwpJcGlyYW5nYSBBdmVudWUsIDY2ODEg4oCTIEJ1aWxkaW5nIDMwClAuTy4g
Qm94OiA5MDYxOS05MDAg4oCTIFBvcnRvIEFsZWdyZS9SUwpQaG9uZTogKzU1IDUxIDMzMjAgMzUw
MCBleHRlbnNpb246IDc2OTYKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCg==


