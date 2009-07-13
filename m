Received: from [209.85.217.227] (helo=mail-gx0-f227.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MQS0c-0001Ox-Nm
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jul 2009 22:20:22 +0200
Received: by gxk27 with SMTP id 27so3848874gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jul 2009 13:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=2ny8KKqi1plAaUOf5eS/t78ua/cYWvVcvTpL8UZkkNw=;
	b=sMcgrRDLuxnIGmoi5pUXrrV1TCgPmrtGr2BwEeF21X8g5vadHKc7w6Zqx1SMeovRIy
	tf0M3nVijVt6cMVZGto0oEl9CFHBqPApiwuh15+e1La2qDYwKNmfJOJW0jbYkyUxq8u2
	8z2/eAW+wHVDcRgOyragcF9BnWWxfc6mFzyLA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fb52fh0/a0+iNijCDGxw2nDp+O9TvklFPJFpZGqiAz1PuCSXRMWCxONuViszejgstG
	sAnbNf7HgIrm8leo5gAKJeKiu9L4Mkig1yl+NPUUNnIKvl2T2x1xTEwQ3Hb48Z4peN3k
	na4m4Y0GnlLyfwB7hE4x380luNyucxynWiRbw=
MIME-Version: 1.0
Received: by 10.151.68.4 with SMTP id v4mr8670939ybk.329.1247515627402; Mon, 
	13 Jul 2009 13:07:07 -0700 (PDT)
In-Reply-To: <20090713185246.GB8275@denix.org>
References: <E1MQNDW-0007ur-Rm@melo.openembedded.org>
	<200907132005.09088.marcin@juszkiewicz.com.pl>
	<20090713185246.GB8275@denix.org>
Date: Mon, 13 Jul 2009 16:07:07 -0400
Message-ID: <f96d234e0907131307q462bc083h3cf25bfe6d4492fd@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Marco Cavallini : Added linux version recipes/linux/linux-2.6. 29 for taskit Stamp9G20 Evaluation Board
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
X-List-Received-Date: Mon, 13 Jul 2009 20:20:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Mon, Jul 13, 2009 at 2:52 PM, Denys Dmytriyenko<denis@denix.org> wrote:
> On Mon, Jul 13, 2009 at 08:05:08PM +0200, Marcin Juszkiewicz wrote:
>> Dnia poniedzia??ek, 13 lipca 2009 o 17:13:22 git version control
>> napisa??(a):
>>
>> Please read CommitPolicy in wiki - first line of commit is summary and
>> should fit in 7x chars (weekly changelog script cuts at 78 chars) and
>> next lines are used for description. Also those two changes should be
>> squashed into one ("git rebase -i origin" would be useful command for
>> next patch set).
>
> Aren't policies required to be read by new developers when git access is
> granted? There used to be a welcome message sent by Mickey with helpful links
> to the Wiki. Is it still the case? Just wondering...

I have not seen such a message, but I suggest that
http://wiki.openembedded.net/index.php/New_commit_rights be updated to
contain any relevant information.  I'll start sending a link to this
page with new commit rights that I add.

Thanks,
Cliff


