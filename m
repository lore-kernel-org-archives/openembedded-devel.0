Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RU3vS-0001U4-3u
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Nov 2011 23:07:18 +0100
Received: by qyk30 with SMTP id 30so753723qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2011 14:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=DNNMYdedLvW6HGrQY3HbgaMTR0gkgwwlsdf2jUD6he0=;
	b=HZBok/i1/zBYrb0qHrI3IlX26krEGpWuQj26UT+VZ+LMZK5zth4nB0rk9JOQda3H68
	p/ujXv1qFWz2J9RhoVtVuECeoYrm4UvG+M59tOGtXjWir3zfpmo/J2u8KFvIvg/UhP9Y
	EoS1wq0IQPNUCtkOqURQ+dqUTPoWYem+c3i5Q=
MIME-Version: 1.0
Received: by 10.229.85.193 with SMTP id p1mr2282352qcl.152.1322258443042; Fri,
	25 Nov 2011 14:00:43 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Fri, 25 Nov 2011 14:00:42 -0800 (PST)
In-Reply-To: <4ECF9562.30503@opendreambox.org>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org> <jal1pc$2u7$1@dough.gmane.org>
	<CACW_hTZpUU0Zyjv4d+ut1n+Rte55TTh5GT_k1W98KzMY9sjL1w@mail.gmail.com>
	<20111124170654.GA28572@sakrah.homelinux.org>
	<4ECE81D3.2010603@opendreambox.org>
	<CAP9ODKrrnc8Op+At6CH2EJbUkTPafGuS=6wMmBXTFsBhA90oTA@mail.gmail.com>
	<4ECF9562.30503@opendreambox.org>
Date: Fri, 25 Nov 2011 15:00:42 -0700
Message-ID: <CA+M6bX=ZK7yY6nxp-pmfTyWndbwsA80JCOpDTKbxtkYqPQ_YgQ@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Fri, 25 Nov 2011 22:07:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 25, 2011 at 6:17 AM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> On 24.11.2011 19:43, Otavio Salvador wrote:
>> On Thu, Nov 24, 2011 at 15:41, Andreas Oberritter <obi@opendreambox.org>wrote:
>>
>>> ...
>>>
>>> I would like stronger arguments for why master and not 2011.03 release
>>>> branch ?
>>>
>>> Obviously, you can push a changeset to master, wait for someone to
>>> complain about a bug, fix the bug, wait for silence, merge it into 2011.03.
>>>
>>
>> Sure not; 2011.03 is for bugfixes not huge changesets with new things.
>
> Who said "huge" or "new"? Even bugfixes need testing. That's why
> changesets should go
> through master after all.

No, but this is why I ask for pull requests to the maintenance branch
not "please do git cherry-pick ...".  I want things that people have
confirmed do what they need done.

-- 
Tom


