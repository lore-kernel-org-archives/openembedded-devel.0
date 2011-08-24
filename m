Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1QwEUD-0001wl-Hc
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 16:31:22 +0200
Received: by gwb11 with SMTP id 11so859399gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 07:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZPiGmXYJeYf6NzePvTraFQY2pXpprGEZRzXskilHULA=;
	b=AS1mIqo1OPEerkNG6vHHq2nCvPWRw9wPrZev+lm1sqTs9R78g+Xjt13Tl4qJH5d+2Y
	6xpnvUonFXFWpjh9I+N3LDWQdbBaG/1rutiDJTai/Yk3dcOfLg2C9Z90tQJR+vHosQJQ
	3cLBBoMe/FNYDzyU2HIWjyek2Dc4RTNOhA1Gg=
MIME-Version: 1.0
Received: by 10.236.154.228 with SMTP id h64mr30087663yhk.77.1314195991739;
	Wed, 24 Aug 2011 07:26:31 -0700 (PDT)
Received: by 10.236.106.100 with HTTP; Wed, 24 Aug 2011 07:26:31 -0700 (PDT)
In-Reply-To: <4E54DA89.2080105@dresearch-fe.de>
References: <4E54DA89.2080105@dresearch-fe.de>
Date: Wed, 24 Aug 2011 10:26:31 -0400
Message-ID: <CAOd_LFy7_ij=gFeadkovP8EkVwM+dCksv0vcimGmQC9JQRD-DQ@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Lauer <mickey@vanille-media.de>
Subject: Re: upstart vs. task-proper-tools
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
X-List-Received-Date: Wed, 24 Aug 2011 14:31:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 24, 2011 at 7:03 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
> We like to create an upstart based image. Therefor we use

Steffen, what are your thoughts on upstart vs systemd?  I am moving
toward systemd for one project, but I'm interested in what others are
choosing and why.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


