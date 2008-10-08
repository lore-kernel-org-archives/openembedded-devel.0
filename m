Received: from [209.85.198.241] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KnTGf-0006Ix-EA
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Oct 2008 09:15:33 +0200
Received: by rv-out-0708.google.com with SMTP id f25so5437445rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Oct 2008 00:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=1ey3Eo1cEoixL91pjJJWofDx9cb/LHB+sabotShQhQ4=;
	b=Ei8p95OUZWulfx2DdxBwDyipb1yuRPlQe/ggVUjT04GTM26efgF0IU4CcctJenW5mz
	p+j7jV+UacShXhEWBk3gfwG1VAGKVerKKcjMY42pwRXt4JNmE1Emdrgv/ieCGm6/tKd/
	5wyVdPv5KL8ROf0jt2nvXSd9niTDRd3ASTLd0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=xYcafyOIZ5PZZAeb2pvXFUK30yxhQ3AnPc9H+OJX5xqqgtmCJmHIxR/FBDxkYug/6/
	tDRsJlbdpHfHJdstPee7gNKfTRJNeazHdFuFedzdSrHL/12HjqpdnEYLBQI+UvrfQoSp
	I/dowRnxPcHt/oFP9/sSuxnZK1HFHPoS0RewA=
Received: by 10.140.134.15 with SMTP id h15mr4652025rvd.65.1223449855890;
	Wed, 08 Oct 2008 00:10:55 -0700 (PDT)
Received: by 10.141.96.7 with HTTP; Wed, 8 Oct 2008 00:10:55 -0700 (PDT)
Message-ID: <19c1b8a90810080010t7b21de2eh376a8693b64053a2@mail.gmail.com>
Date: Wed, 8 Oct 2008 00:10:55 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200810080751.15817.zecke@selfish.org>
MIME-Version: 1.0
References: <200810080751.15817.zecke@selfish.org>
Subject: Re: ETA on git conversion
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
X-List-Received-Date: Wed, 08 Oct 2008 07:15:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gVHVlLCBPY3QgNywgMjAwOCBhdCAxMDo1MSBQTSwgSG9sZ2VyIEZyZXl0aGVyIDx6ZWNrZUBz
ZWxmaXNoLm9yZz4gd3JvdGU6Cj4gSGV5LAo+Cj4gd2Ugd291bGQgbGlrZSB0byBzd2l0Y2ggdG8g
Z2l0IGJ5IG5leHQgd2VkbmVzZGF5LiBKYW4gTMO8YmJlIHdlbnQgdGhyb3VnaCB0aGUKPiBoYXNz
bGUgdG8gZml4IHR3byBpc3N1ZXMgaW4gbXkgbXRuMmdpdC5weSBhbmQgd2UgYXJlIGhhcHB5IHdp
dGggdGhlIG1ldGFkYXRhCj4gYW5kIGNhbiBldmVuIHVuaXRlIGl0IHdpdGggdGhlIGRhdGEgZXhw
b3J0ZWQgZnJvbSBiaXRrZWVwZXIuCj4KPiBUaGUgcGxhbnMgd291bGQgYmU6Cj4gICAgICAgIC0g
U2VuZCB5b3VyIHB1YmxpYyBzc2gga2V5cyBpZiB5b3UgaGF2ZSBub3QgZG9uZSBzbwo+Cj4gVHVl
c2RheToKPiAgICAgICAgLSBTZXQgbW9ub3RvbmUgcmVhZG9ubHkgMTZoIGdlcm1hbiB0aW1lCj4g
ICAgICAgIC0gbWVyZ2UgdGhlIG11bHRpcGxlIGhlYWRzIChpZiB0aGV5IGV4aXN0KQo+ICAgICAg
ICAtIFRyeSB0byBhZGQgdGhlIHJldnMgZnJvbSBub3cgdG8gdHVlc2RheSB0byBnaXQKPgo+IFdl
ZG5lc2RheToKPiAgICAgICAgLSBCZSBiYWNrIHVwIHdpdGggZ2l0IGFuZCB1c2UgdGhhdCBhcyBw
cmltYXJ5IHN5c3RlbS4KPiAgICAgICAgLSBEaXNhYmxlIG1vbm90b25lIGNvbXBsZXRlbHkKPgo+
Cj4gVGhpbmdzIHRvIG5vdGU6Cj4gICAgICAgIFRoZSBoaXN0b3J5IHdpbGwgYmUgZGlmZmVyZW50
IGZyb20gdGhlIHRyaWFsLiBZb3Ugd2lsbCBuZWVkIHRvCj4gZ2l0LXJlYmFzZSAtLWZyb20gdHJp
YWwtaGVhZCAtLXRvIG9mZmljaWFsLWhlYWQgb3IganVzdCBnaXQtcmVzZXQgdG8gZ2V0IHRvCj4g
dGhlIG9mZmljaWFsIGhlYWQuCj4KPiBUaGFua3MgdG8gSmFuIGZvciB3cmVzdGxpbmcgd2l0aCBt
b25vdG9uZSwgZ2l0LCB0aGUgc2NyaXB0IGFuZCB0aGUgZGF0YSBhbmQgd2UKPiB3aWxsIGtlZXAg
eW91IGluZm9ybWVkIGFib3V0IGhvdyB0aGUgbWlncmF0aW9uIGlzIGdvaW5nLgo+Cj4gY29tbWVu
dHMKCkdyZWF0IGpvYiEhCmlmIHdlIGFyZSByZWFkeSB0aGVuIGRvbnQgd2FpdCB0aWxsIG5leHQg
d2Vlay4gV2UgY2FuIHVzZSB0aGlzIHRpbWUgdG8Kc3RhYmlsaXplIG9uIGdpdC4KClRoeAoKLUto
ZW0KPgo+IHouCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gT3BlbmVtYmVkZGVkLWRldmVsIG1haWxpbmcgbGlzdAo+IE9wZW5lbWJlZGRlZC1k
ZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnCj4gaHR0cDovL2xpc3RzLmxpbnV4dG9nby5vcmcv
Y2dpLWJpbi9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1kZXZlbAo+Cg==


