Received: from [64.233.178.240] (helo=hs-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <papercrane@gmail.com>) id 1Jrnra-0005xL-4p
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 May 2008 07:31:19 +0200
Received: by hs-out-0708.google.com with SMTP id 23so1262464hsn.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 May 2008 22:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:reply-to:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=ZJYQhg4kriTfv0NsMhQQ3C/q9bFSdT8xd8TZiFQu0sA=;
	b=kINNWny7zFvjedXWSVhw2JTD9fnOgWvbWv31wzXAkO1YcN5xy0F74//3ma41kHqZ583aDa5WIAYAHb2iTF5amG2ajIuTW/OUpwwZqPjlCZot+J1pF/JxWg1ff0QRAcnB7pItw14WyVayyBIbQRRZoZMzPNpkHb/IyaE/8HHlsvw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=SWJFfCNKYh77NQgRmm3w72lvxZzJ9dCHE7JV232aU2omRUzhQa6vH0nFUsIg7xzqD2XDLF0DNr2gttzBl7MiDQ832dby2AHht/rOALzh8Qs5CrMJaJO+ApajsUsyPhHYFwbuwfQXQ8b52jDbBLsoWV4+zLw/Rbs/HkVMj1fKvmo=
Received: by 10.90.119.20 with SMTP id r20mr4125689agc.60.1209706240390;
	Thu, 01 May 2008 22:30:40 -0700 (PDT)
Received: by 10.90.95.14 with HTTP; Thu, 1 May 2008 22:30:40 -0700 (PDT)
Message-ID: <432beae0805012230q2e5ccf5ejdf49ee69231f3bea@mail.gmail.com>
Date: Thu, 1 May 2008 22:30:40 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200803131229.38083.openembedded@haerwu.biz>
MIME-Version: 1.0
References: <200803110807.11368.zecke@selfish.org>
	<c384c5ea0803121507j60b949dtc704c316b561a5ac@mail.gmail.com>
	<20080313003228.6a4c8ad4@widy.localdomain>
	<200803131229.38083.openembedded@haerwu.biz>
Subject: Re: Reconsidering the work flow and how the SCM system fits in
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Fri, 02 May 2008 05:31:20 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: base64
Content-Disposition: inline

MjAwOC8zLzEzIE1hcmNpbiBKdXN6a2lld2ljeiA8b3BlbmVtYmVkZGVkQGhhZXJ3dS5iaXo+Ogo+
IERuaWEgV2VkbmVzZGF5IDEyIG9mIE1hcmNoIDIwMDgsIFBhdWwgU29rb2xvdnNreSBuYXBpc2Gz
Ogo+Cj4gPiAiTGVvbiBXb2VzdGVuYmVyZyIgPGxlb24ud29lc3RlbmJlcmdAZ21haWwuY29tPiB3
cm90ZToKPgo+Cj4gPiA+IE11bHRpcGxlIGhlYWRzIGFuZCBsaWdodHdlaWdodCBicmFuY2hlcyBh
cmUgdHdvIGRpZmZlcmVudCB0aGluZ3MuCj4gID4KPiAgPiBQcm9iYWJseSBhbHNvIGJlY2F1c2Ug
b2YgZGlmZmVyZW50IG51bWJlcnMgb2YgaGV4YWRlY2ltYWwgZGlnaXRzPwo+ICA+Cj4gID4gPiBB
IGJyYW5jaCBoYXMgYSBuYW1lL3RhZyB0aGF0IHRlbGxzIG1lIHdoYXQgaXMgaGFwcGVuaW5nIGlu
IHRoYXQKPiAgPiA+IGJyYW5jaCBvciB3aG8gaXMgbWFraW5nIGl0IGhhcHBlbi4KPiAgPgo+ICA+
IEFuZCBoZWFkcyBoYXZlIGhlYWQgcmV2aXNpb24gYW5kIGNoYW5nZSBsb2dzIHRvbyEKPgo+ICBB
bmQgZ2V0cyBhdXRvbWVyZ2VkIGJ5IG91ciBtb25vdG9uZSBzZXJ2ZXIuCj4KPgo+ICA+IFdlbGws
IGJ1dCB0aGUgdGFsayB3YXMgYWJvdXQgbWlycm9yaW5nIGFuZCBzeW5jaW5nIHBvdGVudGlhbGx5
Cj4gID4gaW5jb21wYXRpYmxlIGNoYW5nZXMuIERvIGxpZ2h0d2VpZ2h0IGJyYW5jaGVzIGhlbHAg
d2l0aCB0aGlzPwo+Cj4gIFRoZXkgZG8uIEFmdGVyIFBva3kgcmVsZWFzZSBJIHB1c2hlZCBsb3Qg
b2Ygc3R1ZmYgd2hpY2ggSSBoYWQgcmVhZHkgb24gbXkKPiAgaGFyZGRpc2sgKHVudmVyc2lvbmVk
KS4gV2l0aCBHSVQgSSB3b3VsZCBqdXN0IGRvICdwb2t5LWFmdGVyLTMuMS1yZWxlYXNlJwo+ICBi
cmFuY2ggd2hpY2ggd291bGQgZGllIGFmdGVyIG1lcmdpbmcgd2l0aCAndHJ1bmsnLgo+Cj4gIEZv
ciBtYWtpbmcgZXhwZXJpbWVudHMgd2l0aCBQb2t5IEkgY2FuIGNyZWF0ZSBicmFuY2ggKHZpYSBn
aXQtc3ZuIGZvciBub3cpCj4gIHdoaWNoIHdpbGwgaGF2ZSBmZXcgZGF5cyBvZiB3b3JrIGluc2lk
ZSB3aGljaCB3aWxsIHRoZW4gYmUgbWVyZ2VkIGFuZAo+ICBwdXNoZWQuCj4KCldoaWNoIHlvdSBj
YW4gYWxzbyBkbyB3aXRoIG10bi4gTWFrZSBhIGxvY2FsIGJyYW5jaCwgbWFrZSB5b3VyCmNoYW5n
ZXMsIGNvbW1pdCB0aGVtIGxvY2FsbHkuIFdoZW4geW91IHN5bmMvcHVzaCB5b3VyIGxvY2FsIGJy
YW5jaAp3b24ndCBiZSBwdXNoZWQgdG8gdGhlIHNlcnZlci4gV2hlbiB5b3UncmUgZmluaXNoZWQg
c2ltcGx5IHByb3BhZ2F0ZQpiYWNrIHRvIHRoZSBtYXN0ZXIgYnJhbmNoICguZGV2KS4gV2hlbiB5
b3UgbmV4dCBzeW5jL3B1c2ggeW91ciBsb2NhbApyZXZpc2lvbnMgd2lsbCBnbyB1cCBhcyB0aGV5
IGFyZSBhbmNlc3RvcnMgb2YgdGhlIHByb3BhZ2F0ZSBidXQgdGhlCmJyYW5jaCBjZXJ0cyB3b24n
dCBzaW5jZSB0aGUgc2VydmVyIGRvZXNuJ3QgYWxsb3cgdGhhdCBicmFuY2guIE5vdApvbmx5IGRv
IHlvdSBoYXZlIHlvdXIgb3duIGxvY2FsIGJyYW5jaCB3aGljaCBpcyBuZXZlciBwdXNoZWQgdG8g
dGhlCnNlcnZlciwgYnV0IHlvdSBhbHNvIGdldCB0byBrZWVwIGVhY2ggb2Z5b3VyIGNvbW1pdHMu
IE1vcmUgcmV2aXNpb24KaGlzdG9yeSwgbW9yZSBjb21taXQgbWVzc2FnZXMsIG1vcmUgaW5zaWdo
dCBpbnRvIGRldmVsb3BtZW50LiBPZgpjb3Vyc2UsIHlvdXIgbG9jYWwgZGF0YWJhc2Ugc3RpbGwg
aGFzIHRoZSBicmFuY2ggY2VydHMgZm9yIHlvdSBsb2NhbApicmFuY2guIElmIHlvdSB3YW50IHRv
IGdldCByaWQgb2YgdGhlc2UgdGhlcmUgYXJlIGNvbW1hbmRzIHRoYXQgd2lsbApyZW1vdmUgdGhl
bSB0aGF0IGFyZSBzdXJlbHkgbm8gbW9yIGVjb21wbGljYXRlZCB0aGFuIG1vc3Qgb2YgZ2l0J3MK
Y29tbWFuZHMuCgotLSAKSnVzdGluIFBhdHJpbgo=


