Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NfJr2-0003iE-Mp
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 22:12:15 +0100
Received: by fxm25 with SMTP id 25so460552fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 13:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=g28SfGP3v1/n1iVbHg4oTLuMgcUJ+AucM+OeaC+yPGk=;
	b=Wb8uOLyPas0VZrwdipIBsYx4y/itNsMviPrq+kgUR4np1H5SeFS7utt0fToL4ZdTvn
	atcxxbl/xMDf++hZ2FG6xovsFpIp8lsaVVLFG21SltJGKbyC5sAcEQEbyMS2a6Qg42RK
	ZAeeejzI6/DGv1DHr5xtTTZXUen67mYl35mp8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=hplKpfbJZk8G8DcUBvJbTe84kx5xSvhbwgIPKUE4qSSjzvH8BcTSKCuYCeylsZU1XT
	5AE2TBZYrkqAEBFMsO0gOzfbPGXYUw/1DGjO3Qpl3KhqMEIhOXW0qfAp0QRpjgdqGgSV
	SCte3+J9ke+8JMRLuFOInv4h2YoV5o87H+krY=
Received: by 10.223.2.76 with SMTP id 12mr967754fai.62.1265836178940;
	Wed, 10 Feb 2010 13:09:38 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 22sm2688822fkq.54.2010.02.10.13.09.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 10 Feb 2010 13:09:35 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NfJqb-0005dJ-IM; Wed, 10 Feb 2010 22:11:45 +0100
Date: Wed, 10 Feb 2010 22:11:45 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100210211145.GD10632@mx.loc>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-4-git-send-email-rep.dot.nop@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1265663673-16312-4-git-send-email-rep.dot.nop@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 03/12] osso-application-installer: nonworking
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
X-List-Received-Date: Wed, 10 Feb 2010 21:12:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 08, 2010 at 10:14:24PM +0100, Bernhard Reutner-Fischer wrote:
>osso-application-installer depends on nonworking hildon-lgpl

I hereby withdraw this 'bitbake help' hinting on 'world' prompted but
severely misguided attempt from september to get that world straight.
Sorry and cheers,
Bernhard

PS: +1 for teaching bitbake to emit sensible targets within reach.. :/


