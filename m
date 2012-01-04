Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alees@google.com>) id 1RiNtC-0000dG-Ix
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Jan 2012 11:16:10 +0100
Received: by iakh37 with SMTP id h37so28475578iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jan 2012 02:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=beta;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:x-system-of-record:content-type;
	bh=RV8s9AnS1d7RCN2JE8IpR7Fd3OZ1cM1kmFTNHNIpTkg=;
	b=dfLwJ+YieuzMPwCo/XXHsnsW1eLDiypnk7i3/kPQi7d7XnML5ZlpMsym4PsxsxNrko
	wcAIGX2HI4aEihpav44A==
Received: by 10.43.50.67 with SMTP id vd3mr56159143icb.10.1325671728556;
	Wed, 04 Jan 2012 02:08:48 -0800 (PST)
Received: by 10.43.50.67 with SMTP id vd3mr56159130icb.10.1325671728307; Wed,
	04 Jan 2012 02:08:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.231.125.155 with HTTP; Wed, 4 Jan 2012 02:08:27 -0800 (PST)
In-Reply-To: <20111226041239.GA2321@denix.org>
References: <4EF2F380.80704@celestialaudio.com>
	<20111223223753.GA20360@denix.org>
	<CACW_hTbZ=9HZNZGouQoWvLcc2WmDP4O+i+ooF98DYHWOXK79Jw@mail.gmail.com>
	<20111226041239.GA2321@denix.org>
From: Angus Lees <alees@google.com>
Date: Wed, 4 Jan 2012 21:08:27 +1100
Message-ID: <CA+C88Rn9Y6VdJ-Per2rQ2RFTbqu3m6BGaFCMLsHPngyAcwi0Tg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-System-Of-Record: true
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: fakeroot 1.15.1 issues
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
X-List-Received-Date: Wed, 04 Jan 2012 10:16:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 26, 2011 at 15:12, Denys Dmytriyenko <denis@denix.org> wrote:

> On Sun, Dec 25, 2011 at 09:11:36PM +0100, Frans Meulenbroeks wrote:
> > 2011/12/23 Denys Dmytriyenko <denis@denix.org>
> > Actually bumped into this today as well; I saw maintenance moved back to
> > 1.14.6 or so.
> > Latest version is about 1.18.2.2.
> >
> > Guess we should either move master back to 1.14.6, or maybe even move to
> a
> > newer version. or fix the url to point to the snapshot copy.
>
> So, instead of always chasing the very latest version, why not simply set
> the
> Debian mirror variable on a per-distro basis?


Or stick to a fakeroot release that was in a Debian (stable) release, and
hence will be around for a while.

 - Gus

