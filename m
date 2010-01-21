Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NXwGr-0007tX-DL
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 13:36:24 +0100
Received: by yxe5 with SMTP id 5so3891929yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 04:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=TGYuXMisRmwfXshtjshW+LweYspN/6FTXNY3uW1e0J0=;
	b=kcquA6odXAIoD69pAweyLgvmx5V29Sc4nKsbuWAaXsU6jhCE6odaPeJtFwiWMVd3gp
	lCIMIHz70z1NtIQTdzKWzwyWmQip/lGlk51mjZm/Tso+uyQSVpHEpOQkrY1bLN7Fvkth
	Yfhjql6i0giXr2TBldk29mC4TKNIbkanEpABI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=jiw1Ys34SIva7gmioeYpPV8dFuNNynwcf6Lsq7N2rluMGkct2EHRz58BPOzib6Oge5
	RQGjA2znypU9GcpW1kvAk6rM46aW9lo1Vt7Cwx3fSIurbIZcTvj/T8BlYnwmQAJuYzR+
	ggu4ML+PREnwJFcPoLkCjYoOH0e7f0NELGB9Y=
MIME-Version: 1.0
Received: by 10.101.179.23 with SMTP id g23mr1767943anp.171.1264077244056; 
	Thu, 21 Jan 2010 04:34:04 -0800 (PST)
In-Reply-To: <hj9giu$mfp$1@ger.gmane.org>
References: <1264067024.3695.14.camel@mattotaupa.wohnung.familie-menzel.net>
	<201001211102.11252.holger+oe@freyther.de>
	<883120D4-C490-4713-B872-F02376E88CEE@vanille-media.de>
	<hj9giu$mfp$1@ger.gmane.org>
Date: Thu, 21 Jan 2010 13:34:04 +0100
Message-ID: <ac9c93b11001210434x572ca8fduef87174d1c75a41f@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Getting patches committed
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
X-List-Received-Date: Thu, 21 Jan 2010 12:36:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

Even if there is a git branch there needs to be a mail to the list
describing that the git should be pulled. With that there should be a
description on what has changed.
And basically I fear that we are just shifting the problem.
If no one picks up the patches from the list, what makes you guys
think that once they are in a git they get added.

One of the problems with patches (and probably also with git) is who
picks them up.
If someone is sent to the list and it is related to something that I
am knowledgeable in, I'll try to look into it.
If not, I tend to avoid, first of all because of the burden (i feel
that before committing I need to compile it and if possible do some
basic testing, which is tough if it is not really something I have the
knowledge or hw for), and secondly because someone who feels more
attached with the area is also working on it.

Frans


