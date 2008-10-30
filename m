Received: from [72.14.220.152] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <daierxin@gmail.com>) id 1KvTZq-00018C-MX
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Oct 2008 10:12:26 +0100
Received: by fg-out-1718.google.com with SMTP id l26so451775fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2008 02:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type;
	bh=DGbhz0D6qOHV2T4t+d9TkxaPYw2gpYXU8vhCBxY9VMU=;
	b=Jpo34cJ14+dpnnFoLZbpxGu8pDaMLec/ixYwk8uL/6ab8jgZYBAPfyriyrpbdPc4ky
	CM25dRt+AV8ZE9hnt4aJFMwEmpLAMW3BGv2wEqJwwENKtsmm7IQ4M8rA4+wEB7k+plVD
	iu+DwiSHJmphbqfIImwBOzQY8eAoQQLRmqbxU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type;
	b=GyjD4lSu9jjXJRLloza1SCYgJgey7Dpsk76HNBfOF3B/LxS1r1fgNwkJBq28YR8ki9
	X7JszLA2v8a2GyyiaeVee9+GqOVCwy/n9C9/uTY1ndzWhwH5V5ouNKVV7a9bP3811EX1
	UAov1nogfdWaPO/uQiv168AqnGwbeNbdS4kg4=
Received: by 10.86.79.19 with SMTP id c19mr6821148fgb.31.1225357886421;
	Thu, 30 Oct 2008 02:11:26 -0700 (PDT)
Received: by 10.86.58.17 with HTTP; Thu, 30 Oct 2008 02:11:26 -0700 (PDT)
Message-ID: <8f4584b50810300211y34885e4ap9e9251ffa08d438d@mail.gmail.com>
Date: Thu, 30 Oct 2008 17:11:26 +0800
From: "=?GB2312?B?tPq2+9DA?=" <daierxin@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Why can't find preferred version?
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
X-List-Received-Date: Thu, 30 Oct 2008 09:12:28 -0000
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: base64
Content-Disposition: inline

SGVsbG8mIzY1NTMzOyYjNjU1MzM7CiAgICAgIE1ldCBiZWxvdyBwcm9ibGVtcyYjNjU1MzM7JiM2
NTUzMzsKICAgICAgRm9sZGVyICJwYWNrYWdlcy9saWJubCIgaGF2ZSAzIGJiIGZpbGVzOgogICAg
ICBsaWJubF8xLjAtcHJlNi5iYiAvIGxpYm5sXzEuMC1wcmU4LmJiIC8gbGlibmxfMC41LjAuYmIK
CiAgICAgIEkgd2FudCB0byB1c2UgbGlibmxfMS4wLXByZTYuYmIuIEkgYWRkIGJlbG93IGxpbmUg
aW50byAuY29uZiBmaWxlOgogICAgICBQUkVGRVJSRURfVkVSU0lPTl9saWJubCA/PSAiMS4wLXBy
ZTYiCgogICAgIEJ1dCB3aGVuIGNvbXBpbGUsIHRoZSBtZXNzYWdlJiM2NTUzMzsmIzY1NTMzOwog
ICAgIE5PVEU6IHByZWZlcnJlZCB2ZXJzaW9uIDEuMC1wcmU2IG9mIGxpYm5sIG5vdCBhdmFpbGFi
bGUgKGZvciBpdGVtCmxpYm5sKQoKICAgICBwb3AsIGFuZCB0aGUgT0UgdXNlIGxpYm5sXzEuMC1w
cmU4LmJiLiBXaHk/CgogICAgIFRoYW5rcyEKFiYjNjU1MzM7Jg==
