Received: from [209.85.146.176] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1KOFTX-0003ft-38
	for openembedded-devel@openembedded.org; Wed, 30 Jul 2008 19:28:35 +0200
Received: by wa-out-1112.google.com with SMTP id j5so142700wah.4
	for <openembedded-devel@openembedded.org>;
	Wed, 30 Jul 2008 10:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=sfxxMzyvy3aEGWt7aDSHEKluwWC9nmwuMKR1IlhB/W8=;
	b=EOC5ZzvCY0pD9WvXMTKlHtmf7/udJL6rPV5Q5Fukx0RV9ZfloY4b0LyJjMwk4gALdx
	utauqU/Vy+IE+zKf8JT+lwfSv0RSFj8vXibH/UxU0Wp3VaTuzpjIzbB1quXqHAXN4g1j
	SOa4DgIR0n+ScNupmv9anBy3Y+3K0xI8Ah9vU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=OKwm4aeiJj44cQ+UmaLvUx/QwckLSKwYBXeLmVKuAt3Wb/T67oRJVsR76LcbJhVAa8
	24+OSYJVpvfzqruU7tTCdEhU0McCiAYhFaEfAuEx0108diBG3HYp7CCr+mkCY29OD8hd
	0IWGQeelogeyO9Td8EPYv8Gmy1X0KOdsAvayQ=
Received: by 10.114.57.1 with SMTP id f1mr8897280waa.46.1217438811694;
	Wed, 30 Jul 2008 10:26:51 -0700 (PDT)
Received: by 10.114.184.13 with HTTP; Wed, 30 Jul 2008 10:26:51 -0700 (PDT)
Message-ID: <f96d234e0807301026h3ee3d13eqc9cd9e05f7c6a15@mail.gmail.com>
Date: Wed, 30 Jul 2008 13:26:51 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@openembedded.org
In-Reply-To: <f96d234e0807301006x5fc528b8kf9a762021a0024f5@mail.gmail.com>
MIME-Version: 1.0
References: <1217340989.5482.10.camel@dax.rpnet.com>
	<488FAE77.7050107@whitby.id.au>
	<200807300920.37221.openembedded@haerwu.biz>
	<f96d234e0807300429j2fff8df0oc494e4a5beb9f8ff@mail.gmail.com>
	<87myjz34uv.fsf@neumann.lab.ossystems.com.br>
	<4890678A.5040005@balister.org>
	<1217428116.5510.26.camel@dax.rpnet.com>
	<489084EE.9070407@whitby.id.au>
	<1217434487.5510.64.camel@dax.rpnet.com>
	<f96d234e0807301006x5fc528b8kf9a762021a0024f5@mail.gmail.com>
Subject: Re: Git Migration Status
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 30 Jul 2008 17:28:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jul 30, 2008 at 1:06 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> On Wed, Jul 30, 2008 at 12:14 PM, Richard Purdie <rpurdie@rpsys.net> wrote:

>> For b) I'd propose making a list of the monotone IDs we have and asking
>> for opinions of what to do with them. I'm happy for
>> "rpurdie@openembedded.org" to become "Richard Purdie <rpurdie@rpsys.net>
>> for example and that will increase the usefulness of the metadata (some
>> username mappings are much harder to guess). I already have a list of
>> bkcvs ids to monotone IDs so this just leaves the the monotone -> git
>> mappings. Is anyone willing to volunteer to collect a list?
>
> Why not put a list on the wiki and ask people to edit.  I'll see what
> I can find ...

http://wiki.openembedded.net/index.php/Monotone_to_Git_ID_mapping

Please modify as you see fit, or if you need additional information.

Are you proposing at this point that we don't require restrictions on
commiter ID (such as @dev.openembedded.org) ?

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


