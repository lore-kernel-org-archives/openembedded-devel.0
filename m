Received: from [209.85.220.167] (helo=mail-fx0-f167.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay4mail@gmail.com>) id 1LccLe-0004Ey-G8
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Feb 2009 10:16:15 +0100
Received: by fxm11 with SMTP id 11so382522fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2009 01:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:message-id;
	bh=66frXquoaUoJF56YIpm+2BYohGCZW/qS+nsAxHbHTus=;
	b=SjPs6c2H943rUHSdwiQ29Lo9Du9/Cgy4a6B3yYWgjc9f3Ik6h5AVEjINXjVdHwGWpG
	bT+Av/fY3DwozzJcMt7aeptukypOxtxRq1Z+V3fmTZfdhQpwAH9uqsieOfasmA8guoXT
	8w3A/ob3kr8KeP3au16klQOr8DNr5slglpD4g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:message-id;
	b=eRIhQjsxNw/CthbTpZ86aoUsgIUAOTQd278pvK3+gDncWMaH9Q/Qwr3Cxac8h2rXzW
	+f/3ZHcEG9SLlkw5QU2cKfTh7a3DW7rgC61JoXHhF2RHnM9C7bVCqj+Ic8Z5EkiMnKYP
	7EoqCKZkJFlshfI4nhHwCdcWxaoQiJmALOtlE=
Received: by 10.86.57.9 with SMTP id f9mr1967815fga.38.1235639566662;
	Thu, 26 Feb 2009 01:12:46 -0800 (PST)
Received: from is.home (93-81-1-160.broadband.corbina.ru [93.81.1.160])
	by mx.google.com with ESMTPS id 4sm1652446fge.24.2009.02.26.01.12.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 26 Feb 2009 01:12:46 -0800 (PST)
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Feb 2009 12:09:09 +0300
User-Agent: KMail/1.9.10
References: <go498c$bqq$1@ger.gmane.org> <49A5AEB8.7080909@dls.net>
	<go4bh1$kbu$1@ger.gmane.org>
In-Reply-To: <go4bh1$kbu$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200902261209.09173.jay4mail@gmail.com>
Subject: Re: Merge windows, was: Re: [RFC] renaming packages/ to recipes/
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
X-List-Received-Date: Thu, 26 Feb 2009 09:16:56 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello!

> Related to that: a NEWS file would be neat as well, but that's only
> needed when we start doing releases based on the stable branch

Look at FreeBSD UPDATING file too:
http://www.freebsd.org/cgi/cvsweb.cgi/ports/UPDATING?rev=1.780;content-type=text%2Fplain

This file describes big changes in ports to warn users. It recommended to 
read this file before doing upgrade. We can use this idea too.

-- 
Yuri Bushmelev


