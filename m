Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rcis3-0005Ie-8p
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Dec 2011 20:27:35 +0100
Received: by lami14 with SMTP id i14so2254644lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2011 11:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VugYd1chmTjkllZ9/bV/sg6EdIQW5Ds1ERgLmPYnslE=;
	b=UN+5+rG3y1CRqgf3MuUtc7FN6TityPFwSFMEtBpkEKrLI+udqCAc1S3IrpLm+HBEz3
	YBaa5jdfQA0FSvDMKsZRkROapr3qCnm2qA9fCQ/5LGm3agmC84OJmfXmbT+pYsIPoM8c
	v9L4QkQZdMt7u2RG8pqSBDOQKF4A6zMsO7G+Q=
Received: by 10.152.103.51 with SMTP id ft19mr17154535lab.42.1324322431364;
	Mon, 19 Dec 2011 11:20:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.36.198 with HTTP; Mon, 19 Dec 2011 11:20:00 -0800 (PST)
In-Reply-To: <CA452391058F6D4E9715FB2C29D9312A010B90B0@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1324003173-13994-1-git-send-email-b19537@freescale.com>
	<1324003173-13994-5-git-send-email-b19537@freescale.com>
	<jcetai$4n1$5@dough.gmane.org>
	<CA452391058F6D4E9715FB2C29D9312A02CEB8@039-SN2MPN1-022.039d.mgd.msft.net>
	<44FD6890-C4DA-4A40-B30F-BDADC690C21E@dominion.thruhere.net>
	<20111216215455.GC28832@sakrah.homelinux.org>
	<CA452391058F6D4E9715FB2C29D9312A010B90B0@039-SN2MPN1-023.039d.mgd.msft.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Dec 2011 11:20:00 -0800
Message-ID: <CAMKF1sq+5vPUE=10OXQ2agDH=jsvaQ+3DZ5PYx38JPQ42K+G+w@mail.gmail.com>
To: Luo Zhenhua-B19537 <B19537@freescale.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH meta-oe 5/9] nerperf: add
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
X-List-Received-Date: Mon, 19 Dec 2011 19:27:35 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 19, 2011 at 1:52 AM, Luo Zhenhua-B19537
<B19537@freescale.com> wrote:
>> it says "for non-commercial purposes only"
> [Luo Zhenhua-B19537] Does this message mean netperf can't be included in meta-oe?

INAL however I think if its being added for commercial use then
probably not. But ark the legal folks.


