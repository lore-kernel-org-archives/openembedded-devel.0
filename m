Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RfOZz-0003aS-VB
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Dec 2011 05:24:00 +0100
Received: by qcqw6 with SMTP id w6so6419068qcq.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Dec 2011 20:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=BaW8j+DyeG+ZbmpmH3253KUrgoBC2mAJ4LsLDXgWos8=;
	b=wG6aaW2EWA9Fs1T8mv5GK7DEbPqehM8BqJMn9dUZbe7FgnH9xN1rk/PqlcYPh1Ssqu
	DrBvHZmZnQ5Dq/NnMoR6ghPsoehXeIk2hRQxgtF7BeSPGYzI20Ww0nqkWMPQESS7O0K2
	waXDFe2FT3yp2m51hkynZ15kVyBH2kwLjBAf4=
MIME-Version: 1.0
Received: by 10.229.102.163 with SMTP id g35mr7836758qco.78.1324959407887;
	Mon, 26 Dec 2011 20:16:47 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Mon, 26 Dec 2011 20:16:47 -0800 (PST)
In-Reply-To: <CACW_hTbaEcTcwhut+9NJX6yci6Mu6w+uhqB3xKcfORSg5gM2FA@mail.gmail.com>
References: <CACW_hTbaEcTcwhut+9NJX6yci6Mu6w+uhqB3xKcfORSg5gM2FA@mail.gmail.com>
Date: Mon, 26 Dec 2011 21:16:47 -0700
Message-ID: <CA+M6bXn4T8YO5SwiotYJcy3K2ioQtUBsGLCTOXCZZE=yU2vdBg@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] net-snmp: please cherry pick 4a98e62ac35d4367d3c072819317deeda52abf5e from master
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
X-List-Received-Date: Tue, 27 Dec 2011 04:24:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 26, 2011 at 1:29 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Please merge this one
> http://cgit.openembedded.org/openembedded/commit/?id=4a98e62ac35d4367d3c072819317deeda52abf5e
>
> to the maintenance tree. it updates net-snmp to 5.7.1; the existing version
> does not build for uclibc; this fixes it.

Per the wiki page, this is not a proper request for the maintenance
branch, please re-submit a pull request with the cherry-pick tested
and confirmed to fix the issue, thanks.

-- 
Tom


