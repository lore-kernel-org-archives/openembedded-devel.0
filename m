Received: from [74.125.92.149] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Lpppw-0000qx-BT
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Apr 2009 22:18:10 +0200
Received: by qw-out-1920.google.com with SMTP id 5so953149qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Apr 2009 13:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=wJGX7VXIdn052f8hUg7ZWL8GAROBcAzqZiHCF0kRfrc=;
	b=MiuwSEMJWA1jMpj7dlfvr/MR42I5v3uwUns9YX50ag3TlInzKa7a9wxO5eZvWTP/ee
	PDRS010GNkb8drP4AYaugg+NZCG9YHndai0Z2KWnKS9iN1qX9r+8tMeQLRjzd5pFJTwB
	9cWiM3v2BwvdFbpq9TNGWlEiGK8G0HRLxr62k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=v7RE3T0ZSsQrWX745T7C7QdACv3FsCb/sQHiUouDpY0hTSlP2mHnwcpbGZeozJ1ioB
	CP+xBlfr3fTZTU3pPso1J7nGVgJcgfRhbd5slEuubWctxljw9iQyzwgHR4ETybjSKN1P
	+dUFqH+NhNIMAZ2cmq+ydokVyUgee6nk02eKA=
Received: by 10.224.37.143 with SMTP id x15mr2008576qad.146.1238789726754;
	Fri, 03 Apr 2009 13:15:26 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 4sm7236007yxd.36.2009.04.03.13.15.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 03 Apr 2009 13:15:25 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id EA2736100B7; Fri,  3 Apr 2009 17:15:39 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <1236890935.6250.26.camel@northpole>
	<1237220171.4020.4.camel@faraday>
	<be7a9f3d0903161800i3f6735c8u7eafe009f2cb0b88@mail.gmail.com>
	<1237928739.20348.3.camel@northpole>
	<878wmu48qc.fsf@neumann.lab.ossystems.com.br>
	<49D65E44.2080002@2mi.com.br>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Fri, 03 Apr 2009 17:15:39 -0300
In-Reply-To: <49D65E44.2080002@2mi.com.br> (Jader H. Silva's message of "Fri, 
	03 Apr 2009 16:06:44 -0300")
Message-ID: <87eiw94hp0.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 74.125.92.149
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: calibrateproto git tag
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
X-List-Received-Date: Fri, 03 Apr 2009 20:18:11 -0000
Content-Type: text/plain; charset=us-ascii

"Jader H. Silva" <jader@2mi.com.br> writes:


[...]

> Patch in git format-patch is attached, sorry for the delay.
> From 7511e3619f63200239efcff64996616c700024ab Mon Sep 17 00:00:00 2001
> From: Jader H. Silva <vo@northpole.(none)>

[...]

Your GIT configuration is wrong. I've fixed it while applying it to my
tree and will push it but please look at your GIT setup.

From: Jader H. Silva <vo@northpole.(none)>
                      ^^^^^^^^^^^^^^^^^^^

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


