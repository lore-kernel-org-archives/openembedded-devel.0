Received: from mail-vc0-f182.google.com ([209.85.220.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TtGsm-0003Wz-95
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 13:05:16 +0100
Received: by mail-vc0-f182.google.com with SMTP id fy27so387635vcb.41
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 03:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=yU747mlxiKAHAUelxHxufINJCz1ExfQM2qpyGnoS4oA=;
	b=eTfiVisW3XLLyNyVFuU8d0kM0Jt5DnthrwZ8Pjk3XvsHnSU9l0jvmeXEqh2qHq1VGE
	Q+40FqPR0u1bW73yEm6d+209ayPhPDCh3jtm866h4xZ90zfyK+IB+aTSnpS4RkSHru37
	u7eVQvZcKva70tOa9tMF7TvY2upeXoXESEkjjPjBlzPliwgAfHIX1hs9AkK3mihl8qCI
	JKWjuzpUm3ZJ4RxNNEH6kK0bwuZrkAsdWaDVgBBanjVUbwvdTrAKU9c/eM429eV+bGxw
	eORlyMKeetBocs1V1F4diYVcODiKOD2SBubBo1PJBB6wB8co0dhuVdokRXcm9Cyzl+5z
	z5kQ==
MIME-Version: 1.0
Received: by 10.58.30.7 with SMTP id o7mr93780024veh.19.1357818601822; Thu, 10
	Jan 2013 03:50:01 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Thu, 10 Jan 2013 03:50:01 -0800 (PST)
In-Reply-To: <20130110113445.GC3722@jama.palm1.palmone.com>
References: <1357774995-1104-1-git-send-email-schnitzeltony@googlemail.com>
	<20130110112231.GZ3722@jama.palm1.palmone.com>
	<20130110113445.GC3722@jama.palm1.palmone.com>
Date: Thu, 10 Jan 2013 12:50:01 +0100
Message-ID: <CALbNGRSoDq0sqrJnur-O7=vT_-qpWZwCPYJUpK46Zc+Yiz5pXA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia/meta-oe/meta-systemd 0/3] new recipes/appends
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
X-List-Received-Date: Thu, 10 Jan 2013 12:05:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 12:34 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Thu, Jan 10, 2013 at 12:22:31PM +0100, Martin Jansa wrote:
>> On Thu, Jan 10, 2013 at 12:43:12AM +0100, Andreas M=C3=BCller wrote:
>> > 1+2 resend (Patchwork was down)
>> > 3. I have this in and working for long time
>> >
>> > The following changes since commit 89d5899c38ec94b0560a3496b020e45b40d=
8251c:
>> >
>> >   python-distutils-extra: initial add 2.36 (2013-01-09 16:20:22 +0100)
>>
>> This commit is not in master.
I should not send patches late night :)
>>
>> First 2 patches applied from previous patches on ML, thanks!
>
> Grr, SOB lines are missing in repo and I've just refreshed them from
> repo just before pushing them and checked only with git diff that they
> are still the same :/.
Next pull request contains SOB. I don't know how Koen did that but the
pull requests applied contained SOB
>
>> > Andreas M=C3=BCller (3):
>> >       openal-soft: initial add 1.15.1
>> >       physfs: initial add 2.0.3
>> >       bluez4: add systemd support
Shall I resend or wait for oe-core systemd?

Andreas


