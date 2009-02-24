Received: from [74.125.92.146] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Lc1e3-0000a1-6Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Feb 2009 19:04:39 +0100
Received: by qw-out-1920.google.com with SMTP id 5so907750qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2009 10:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=yG+yzH50imZdDPbffT9PrEv90AvJ4aqKRtB0zFhst3U=;
	b=X0RGzCV2lBpIRRM0IjdKH37TD6wlGBjwHfkVAwXHPbJI8u9TQ21+4fcV3MMdszyPKl
	2iYo4iu0GCo9TBtXoniroFYlu7HI2t7LcUkg5A11G55tOiLHXjyoVFcetINHS9xMCDYM
	K8mjwdBULlVlNVXT4+7HnpHbR+ViroF+D6Ljg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=YECpOj6aW5pfQiQ4qzetpo/fdW5Yo4DpBcwoS16C0mh6n9aOmQ8apliidtuEMvF6BZ
	DE00SgiW92sACqaeA6mz1SkBcCZSf0BkonSiwAYaQ2XwzV9JaN5PfZ4oa7cphtF3zmCt
	6/+SMLNYEJNqjRMiUK+fk6ofGkiOsPxHy54Fs=
Received: by 10.224.2.75 with SMTP id 11mr7306qai.262.1235498495941;
	Tue, 24 Feb 2009 10:01:35 -0800 (PST)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 5sm3113668qwg.54.2009.02.24.10.01.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 24 Feb 2009 10:01:35 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 63A446100F6; Tue, 24 Feb 2009 15:01:30 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <200902131728.08634.openembedded@haerwu.biz>
	<20090224064639.GE2172@smtp.west.cox.net>
	<1235492001.27962.60.camel@andromeda>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Tue, 24 Feb 2009 15:01:30 -0300
In-Reply-To: <1235492001.27962.60.camel@andromeda> (Michael Lauer's message of
	"Tue, 24 Feb 2009 17:13:21 +0100")
Message-ID: <8763izyarp.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Subject: Re: checksums situation
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
X-List-Received-Date: Tue, 24 Feb 2009 18:04:39 -0000
Content-Type: text/plain; charset=us-ascii

Michael 'Mickey' Lauer <mlauer@vanille-media.de> writes:

> Am Montag, den 23.02.2009, 23:46 -0700 schrieb Tom Rini:
>> I'm going to make a different suggestion.  Lets just drop it. 
>
> I'm in favour of this. I don't think they give us the safety we want and
> they introduce more inconvenience.

After reading the thread I'm also in favour of this.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


