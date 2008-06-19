Received: from [216.239.58.185] (helo=gv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lvcargnini@gmail.com>) id 1K9Olv-0002VV-L3
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jun 2008 20:22:11 +0200
Received: by gv-out-0910.google.com with SMTP id u5so165112gve.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2008 11:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:reply-to
	:to:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=rQ0AAmndgXI6QiK6X6es+s0iJu8tJl3UEF+y6mNusOk=;
	b=swuGRHO8P8U7IIEQauzhDiC6TgLG7TbhVI+3poqcicDqB9lHOxDadgTJaZrmMi0O+o
	8ppYVVH9rkfSQCzCVMqtlE67BusJSCrVYU3ZcltxSro47wq3XbATR0pcGzys9fKOmRCG
	7mDb03zTardIRT2VqQxQq1xejEkdX+LrweBOI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:to:subject:cc:in-reply-to
	:mime-version:content-type:content-transfer-encoding
	:content-disposition:references;
	b=nke88OYGi/tAL1L0kzGhFLL6NIqorL/49mBWQ1ksoYLZefWIIlkuoYDwwcuUky4zem
	WKZ/iJiOYA2qg3goXWzCJip1qBQpPCYOVX8mAARaUhjEx3AFl/qvjrXU/kecxFyTp3ez
	SOQ01RBbnl6KOgw04nXUPIApaz0PUcZek8wyc=
Received: by 10.210.34.5 with SMTP id h5mr2183570ebh.84.1213899660750;
	Thu, 19 Jun 2008 11:21:00 -0700 (PDT)
Received: by 10.210.24.18 with HTTP; Thu, 19 Jun 2008 11:21:00 -0700 (PDT)
Message-ID: <ae36f8040806191121q221b5881x6e0064c791394853@mail.gmail.com>
Date: Thu, 19 Jun 2008 15:21:00 -0300
From: "=?UTF-8?Q?Lu=C3=ADs_Vit=C3=B3rio_Cargnini?=" <lvcargnini@gmail.com>
To: "Hans Henry von Tresckow" <hvontres@gmail.com>
In-Reply-To: <ae36f8040806181114o78d06b43v883d9074b8c15a8b@mail.gmail.com>
MIME-Version: 1.0
References: <ae36f8040806180812j37bca53lf1e06722a8246a55@mail.gmail.com>
	<200806181725.49146.mickey@vanille-media.de>
	<ae36f8040806180956r7143e0eelc1adbf65112d9a3c@mail.gmail.com>
	<200806181931.16473.mickey@vanille-media.de>
	<ae36f8040806181048u527e1133q9532b2dcffcd4780@mail.gmail.com>
	<a7f8874a0806181100q2981dd42ke57a69cafd1bc607@mail.gmail.com>
	<ae36f8040806181114o78d06b43v883d9074b8c15a8b@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
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
X-List-Received-Date: Thu, 19 Jun 2008 18:22:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Content-Disposition: inline

b2sgdGggZWxvY2FsLmNvbmYgc2hvdWxkIGJlIG1vdmVkIGZyb20gYnVpbGQvbG9jYWwgdG8gYnVp
bGQvY29uZiBvbmx5CnRoaXMgdGhhbiBJIGFuIGxldCBvbmx5IEJCUEFUSCBleHBvcnRlZC4KCk9u
IFdlZCwgSnVuIDE4LCAyMDA4IGF0IDM6MTQgUE0sIEx1w61zIFZpdMOzcmlvIENhcmduaW5pCjxs
dmNhcmduaW5pQGdtYWlsLmNvbT4gd3JvdGU6Cj4gSSBkaWQgYXMgeW91IHNhaWQgYnV0IGl0IG5v
dCB3b3JrZWQgdG9vOgo+IGx2Y2FyZ25pbmlAcHJvdGhldXM6fi9pbnN0cmFtZWQvb3BlbmVtYmVk
ZGVkJCBiaXRiYWtlIGJhc2UtaW1hZ2UKPiBFUlJPUjogIE9wZW5lbWJlZGRlZCdzIGNvbmZpZyBz
YW5pdHkgY2hlY2tlciBkZXRlY3RlZCBhIHBvdGVudGlhbAo+IG1pc2NvbmZpZ3VyYXRpb24uCj4g
ICAgICAgIEVpdGhlciBmaXggdGhlIGNhdXNlIG9mIHRoaXMgZXJyb3Igb3IgYXQgeW91ciBvd24g
cmlzayBkaXNhYmxlIHRoZQo+IGNoZWNrZXIgKHNlZSBzYW5pdHkuY29uZikuCj4gICAgICAgIEZv
bGxvd2luZyBpcyB0aGUgbGlzdCBvZiBwb3RlbnRpYWwgcHJvYmxlbXMgLyBhZHZpc29yaWVzOgo+
Cj4gICAgICAgIFBsZWFzZSBzZXQgVEFSR0VUX0FSQ0ggZGlyZWN0bHksIG9yIGNob29zZSBhIE1B
Q0hJTkUgb3IgRElTVFJPIHRoYXQgZG9lcyBzby4KPiBQbGVhc2Ugc2V0IFRBUkdFVF9PUyBkaXJl
Y3RseSwgb3IgY2hvb3NlIGEgTUFDSElORSBvciBESVNUUk8gdGhhdCBkb2VzIHNvLgo+IERJU1RS
TyAnTm9uZScgbm90IGZvdW5kLiBQbGVhc2Ugc2V0IGEgdmFsaWQgRElTVFJPIGluIHlvdXIgbG9j
YWwuY29uZgo+Cj4KPiBPbiBXZWQsIEp1biAxOCwgMjAwOCBhdCAzOjAwIFBNLCBIYW5zIEhlbnJ5
IHZvbiBUcmVzY2tvdwo+IDxodm9udHJlc0BnbWFpbC5jb20+IHdyb3RlOgo+Pgo+Pgo+PiBPbiBX
ZWQsIEp1biAxOCwgMjAwOCBhdCAxMDo0OCBBTSwgTHXDrXMgVml0w7NyaW8gQ2FyZ25pbmkKPj4g
PGx2Y2FyZ25pbmlAZ21haWwuY29tPiB3cm90ZToKPj4+Cj4+PiBJIGZpeGVkIHRoaXMgaXNzdWUg
ZXhwb3J0aW5nIGFsbCB0aGUgdmFyaWFibGVzIG9mIHRoZSBsb2NhbC5jb25mIGFzCj4+PiBlbnYg
dmFycyBpbnNpZGUgYmFzaAo+Pj4gI09wZW5FbWJlZGRlZAo+Pj4gZXhwb3J0Cj4+PiBCQlBBVEg9
JEhPTUUvaW5zdHJhbWVkL29wZW5lbWJlZGRlZDokSE9NRS9pbnN0cmFtZWQvb3BlbmVtYmVkZGVk
L2J1aWxkOiRIT01FL2luc3RyYW1lZC9vcGVuZW1iZWRkZWQvb3JnLm9wZW5lbWJlZGRlZC5kZXYK
Pj4+IGV4cG9ydCBQS0dESVI9JEhPTUUvaW5zdHJhbWVkL29wZW5lbWJlZGRlZC9idWlsZC8KPj4+
IGV4cG9ydAo+Pj4gQkJGSUxFUz0iJEhPTUUvaW5zdHJhbWVkL29wZW5lbWJlZGRlZC9vcmcub3Bl
bmVtYmVkZGVkLmRldi9wYWNrYWdlcy8qLyouYmIiCj4+PiBleHBvcnQgRElTVFJPPSJhbmdzdHJv
bS0yMDA4LjEiCj4+PiBleHBvcnQgTUFDSElORT0ib21hcDU5MTJvc2siCj4+PiBleHBvcnQgSU5I
RVJJVD0icGFja2FnZV9pcGsiCj4+PiBleHBvcnQgSU1BR0VfRlNUWVBFUz0iamZmczIgdGFyLmJ6
MiBjcmFtZnMgc3F1YXNoZnMiCj4+PiBleHBvcnQgQkJJTkNMVURFTE9HUz0ieWVzIgo+Pj4gIGFu
ZCBpdCBzZWVtcyB0byBiZSB3b3JraW5nCj4+Pgo+Pj4KPj4KPj4gWW91IHNob3VsZCBvbmx5IG5l
ZWQgdG8gZXhwb3J0IEJCUEFUSCB0byB0aGUgc2hlbGwuIFRoYXQgd2F5IGJpdGJha2UgY2FuCj4+
IGZpbmQgeW91ciBsb2NhbC5jb25mIGZpbGUgYW5kIGFsbCB0aGUgb3RoZXIgdmFycy4KPj4KPj4K
Pj4gLS0KPj4gSGVucnkgdm9uIFRyZXNja293IChodm9udHJlcykKPgo+Cj4KPiAtLQo+IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+IFRoYW5rcyAmJiBSZWdhcmRzCj4gTS5TYy4gQi5TYy4gTHXDrXMg
Vml0w7NyaW8gQ2FyZ25pbmkKPiBJRUVFIE1lbWJlcgo+IEVsZWN0cmljYWwgRW5naW5lZXIgRmFj
dWx0eSBAIFBVQ1JTCj4gSXBpcmFuZ2EgQXZlbnVlLCA2NjgxIOKAkyBCdWlsZGluZyAzMAo+IFAu
Ty4gQm94OiA5MDYxOS05MDAg4oCTIFBvcnRvIEFsZWdyZS9SUwo+IFBob25lOiArNTUgNTEgMzMy
MCAzNTAwIGV4dGVuc2lvbjogNzY5Ngo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+CgoKCi0t
IAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KVGhhbmtzICYmIFJlZ2FyZHMKTS5TYy4gQi5TYy4gTHXD
rXMgVml0w7NyaW8gQ2FyZ25pbmkKSUVFRSBNZW1iZXIKRWxlY3RyaWNhbCBFbmdpbmVlciBGYWN1
bHR5IEAgUFVDUlMKSXBpcmFuZ2EgQXZlbnVlLCA2NjgxIOKAkyBCdWlsZGluZyAzMApQLk8uIEJv
eDogOTA2MTktOTAwIOKAkyBQb3J0byBBbGVncmUvUlMKUGhvbmU6ICs1NSA1MSAzMzIwIDM1MDAg
ZXh0ZW5zaW9uOiA3Njk2Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo=


