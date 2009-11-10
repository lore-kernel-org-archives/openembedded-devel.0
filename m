Received: from [209.85.220.209] (helo=mail-fx0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N7o9D-0003vs-Oz
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 11:40:30 +0100
Received: by fxm1 with SMTP id 1so1605480fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 02:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=xlbl5mGDvBPUq9MosoZULKJD95S/1HtQYEvTEUDJ5wI=;
	b=omtaIO7wX/vfZTRu1yUX0GmvgY2u+0DUiNB/IS/l5xlK5PkSOhZwwOR7riQzWUw/gI
	n5ta1VcmpfU9yxkB+Nw9Df9QXOXbT/mB7dNS/n7oPHRPObs8YH3ue4hP2zKxW0pBVEpg
	aTEUZKYFrVCcu8UKQcmAMbZIhbKVFE4OUT5rQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=UYgigfvpZ/Nc9duFdrN2Edw+q9jNZDl2UtCZQjeTuwxS2neC+ssPMpXy/Go7kDgJyx
	EUXat/2DaEUPs44JDPRiRVDBREvo6d6+Xi09DlLqsbOpRIpl/quKsaCfWkqPFJl9NRH0
	lOd077X95SNceMn1KvWmtU0RKwBCm7eI6D2JE=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.183.20 with SMTP id s20mr892850hbg.66.1257849550343; Tue, 
	10 Nov 2009 02:39:10 -0800 (PST)
In-Reply-To: <1257817816.29038.153.camel@dax.rpnet.com>
References: <1257762970.29038.40.camel@dax.rpnet.com>
	<hdaeo3$9l5$1@ger.gmane.org>
	<1257817816.29038.153.camel@dax.rpnet.com>
Date: Tue, 10 Nov 2009 08:39:10 -0200
X-Google-Sender-Auth: 238f313ef8e0adb6
Message-ID: <be7a9f3d0911100239k1fdbc89dr28a4d355d7cad27f@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM - Summary of some the outcome
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
X-List-Received-Date: Tue, 10 Nov 2009 10:40:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Mon, Nov 9, 2009 at 11:50 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> That is unfortunate but I suspect if we waited until everyone's personal
> favourite distro adopted it, we'd impose artificial limits on what is a
> development branch. No easy solution really :(.

Even being a big fan of Debian I must to agree here; OE shouldn't wait
for distros to make changes otherwise we'll have a nightmare to
manage.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


