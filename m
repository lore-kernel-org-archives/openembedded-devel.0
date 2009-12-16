Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1NL18y-00051l-8m
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Dec 2009 22:10:51 +0100
Received: by fxm4 with SMTP id 4so1339629fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2009 13:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type; bh=zdAn278QbuLJMJiR+1/Db5GsZAbOpVPbnRlCoWBS25g=;
	b=kYDRoUurvZyCQr4+Y0+Y0RfJIFROVLg5eKUtLCjd1s9vf16frJbbbRtr5DJlZ6mWX/
	kUsTxmY1u4eubJ4B29VEIICeUu/2q6cFijZvHwNLjUvVTWyZVnd8bsUmK37MP31i9e9F
	NjWJme70p3wFBn0ZelH/EAU8cdB49mSWrPVxk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	b=YGLvxU+uMibzjV9C9jmLcUQzY77x80Bn5zreqKgA4SUibR+pzJPQ2mpDV7XFkHfaWR
	zlYz3u0/obr/dzUfLvhQTafCa2/qYAuxoP6PAjBwjedC/5HVmTl4QtbscS3k6xEdDGYU
	x9E+sh8t3n6cYzsiVY/kqAbYcf0oVdgyQGaTg=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.168.220 with SMTP id l28mr141442hbe.117.1260997740992; 
	Wed, 16 Dec 2009 13:09:00 -0800 (PST)
In-Reply-To: <20091216164339.GA28014@lundinova.se>
References: <1260980999-27920-1-git-send-email-johan.hovold@lundinova.se>
	<1260981572-28691-1-git-send-email-johan.hovold@lundinova.se>
	<20091216164339.GA28014@lundinova.se>
Date: Wed, 16 Dec 2009 19:09:00 -0200
X-Google-Sender-Auth: 1633a25d1ff73852
Message-ID: <be7a9f3d0912161309p182cbdefm784dc7931e8963fb@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] openvpn: remove dependency on kernel module
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
X-List-Received-Date: Wed, 16 Dec 2009 21:10:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Wed, Dec 16, 2009 at 2:43 PM, Johan Hovold <johan.hovold@lundinova.se> wrote:
> My second patch bumped PR from r0 directly to r2 for two of the recipes.
> Fixed in the last one (bump to r1).

Please move it to INC_PR as well.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


