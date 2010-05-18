Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OEPNA-0007sG-Vf
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 May 2010 18:10:25 +0200
Received: by iwn2 with SMTP id 2so1659948iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 May 2010 09:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=8lR+SvDZTKu/QxosHRk32hPRIEpkDKqb7UPIem3IsIY=;
	b=hITzJE1Dsbu/nagw76ZL06Cv7lQvODYb7u0OSLpK/L1a8g8RdlGn61vWdNdn0nheZH
	YZ1OLR3EXoQ6gfVSyJzM84Oj93Gy+tCFzqI2tJCplKlI+bdtYt01Q+RlkLD+fS2Iqy+R
	LtmbmrDFSsrt2JN86tV05WOWzRdxcMQv0zU+0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=rV2z22Eu1fAcUiKzIjGVUNKfoGQQZ7hmC1u23OLdiJ49/dTCNX1g9GQC580IPVDTIs
	hT01y7+LqtwDX0Vi3S4g5tWvxU1BW1qHATTe98KgUu2C22Twq9YxJRo5G7C4916ryxlo
	PHDuLISy661/BGeM8UeixCqR+IBoBT3YnrkYw=
MIME-Version: 1.0
Received: by 10.231.174.201 with SMTP id u9mr2219770ibz.17.1274198785370; Tue, 
	18 May 2010 09:06:25 -0700 (PDT)
Received: by 10.231.37.139 with HTTP; Tue, 18 May 2010 09:06:25 -0700 (PDT)
In-Reply-To: <4BF2B3C7.7060700@matrix-vision.de>
References: <4BF2B3C7.7060700@matrix-vision.de>
Date: Tue, 18 May 2010 12:06:25 -0400
Message-ID: <AANLkTimH7otrK2goIN2xZ0Jkp69tntDYY30qXzfDnZ1M@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] docs/ spelling fixes
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
X-List-Received-Date: Tue, 18 May 2010 16:10:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

n Tue, May 18, 2010 at 11:35 AM, Michael Jones
<michael.jones@matrix-vision.de> wrote:
> Just a few things in the documentation I noticed while reading up on OE. =
I don't understand why 'git diff' included "\ No newline at end of file" fo=
r some of these, or how I could instruct it not to, but I also didn't want =
to pick apart my patch outside of git.

Thanks, applied.

Cliff


