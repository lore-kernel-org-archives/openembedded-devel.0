Received: from [209.85.200.172] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jroman.espinar@gmail.com>) id 1JrW2x-0004X1-8d
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 May 2008 12:29:54 +0200
Received: by wf-out-1314.google.com with SMTP id 23so809105wfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 May 2008 03:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
	bh=vrS0vvkV2njxToXqggzA6uItq5wbuuovWep9z+s9kNE=;
	b=PY8HgUvR1o2BM9OxmYteQCDKYCLi5RrqyfOOmKH/v9gk2Pm0I7czvvfW1SdEXcsR2eE45vr9UG2APRg02mJ/fIs1ugIrtgERW4rEEElJ0uWkvrYsj0kzWCPpk3J1YDFCd7+dFa8zZyZf18uAG7yrXl1nLOYmDRYR5sc0e8DdMsM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:sender:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
	b=NMZISXKjdp07S615+pQkLYPx/nCHeU0R0g/V+LSKoOyKCwA08UOSR+7NMT09t898hoXil5j/XdmuWIP9V9PDam5TmWodQ8qV4fOjEyxLzGE7m2TIfKB8HqMTNWYRevwbripxkE19JX8yvStSG7s6TGonf6KpHpzK6XbYHKPslhU=
Received: by 10.143.37.14 with SMTP id p14mr721129wfj.267.1209637750830;
	Thu, 01 May 2008 03:29:10 -0700 (PDT)
Received: by 10.142.155.16 with HTTP; Thu, 1 May 2008 03:29:10 -0700 (PDT)
Message-ID: <12c2e32e0805010329p43c30249m670c23999e890431@mail.gmail.com>
Date: Thu, 1 May 2008 12:29:10 +0200
From: "Javi Roman" <javiroman@kernel-labs.org>
Sender: jroman.espinar@gmail.com
To: "Using OE" <openembedded-users@lists.openembedded.org>
In-Reply-To: <200804301441.47249.openembedded@haerwu.biz>
MIME-Version: 1.0
References: <12c2e32e0804300521u4149d575tb3cfde6456b2919e@mail.gmail.com>
	<12c2e32e0804300529p37c2b4f1yb6d6c7cca1e52fd8@mail.gmail.com>
	<200804301441.47249.openembedded@haerwu.biz>
X-Google-Sender-Auth: 726e3cdd7804d89e
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: yet another OE manual
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
X-List-Received-Date: Thu, 01 May 2008 10:29:55 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: base64
Content-Disposition: inline

MjAwOC80LzMwIE1hcmNpbiBKdXN6a2lld2ljeiA8b3BlbmVtYmVkZGVkQGhhZXJ3dS5iaXo+Ogo+
IERuaWEgV2VkbmVzZGF5IDMwIG9mIEFwcmlsIDIwMDgsIEphdmkgUm9tYW4gbmFwaXNhszoKPgo+
Cj4gID4gIEkgaGF2ZSBqdXN0IHJlbGVhc2VkIGEgbmV3IG1hbnVhbCAoZm9yIGJlZ2lubmVycykg
YWJvdXQgT0UgaW4gdGhlCj4gID4gZm9sbG93aW5nIFVSTDoKPiAgPgo+ICA+ICBodHRwOi8vd3d3
Lmtlcm5lbC1sYWJzLm9yZy9vcGVuZW1iZWRkZWQtZ3VpZGUKPiAgPgo+ICA+ICBJIGhvcGUgeW91
IGZvdW5kIGl0IHVzZWZ1bC4gSSBhc2sgeW91IGZvciBmZWVkYmFjaywgY29tbWVudHMsCj4gID4g
IHN1Z2dlc3Rpb25zLCAuLi4sIGZsYW1lcyA7LSkKPgo+ICBXaHkgbm90IG1lcmdlIHRoaXMgaW50
byBvZmZpY2lhbCBPRSBkb2N1bWVudGF0aW9uPwo+CgpIZWxsbywKCml0IHdvdWxkIGJlIGFuIGhv
bm91ciB0byBtZSBpbmNsdWRlIGEgbGluayBpbnRvIE9FIGRvY3VtZW50YXRpb24gcGFnZS4KSSBz
dXBwb3NlIEkgY2Fubm90IHVwZGF0ZSB0aGUgd2lraSwgT0Ugd2lraSBhY2NvdW50cyBhcmUgb25s
eSBmb3IgT0UKbWVtYmVycywgaXNuJ3QgaXQ/CgotLSAKSmF2aSBSb21hbgoKUGxlYXNlIGF2b2lk
IHNlbmRpbmcgbWUgV29yZCBvciBQb3dlclBvaW50IGF0dGFjaG1lbnRzLgpTZWUgaHR0cDovL3d3
dy5nbnUub3JnL3BoaWxvc29waHkvbm8td29yZC1hdHRhY2htZW50cy5odG1sCg==


