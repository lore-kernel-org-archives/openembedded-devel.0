Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TAjlx-0007nR-9b
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Sep 2012 17:50:09 +0200
Received: by eekb57 with SMTP id b57so546469eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2012 08:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=KrfpxVmebdG4nINHcYRdjxOej2/ugQfu03RncRkP2+Y=;
	b=dteSXG+61BzcJ1yAXWt+oe1fDxdQ5uTf0svBRRMiEG87rJQE1jlptHUdq/0AZgQoz3
	y6vALbLfZYPY+PO1h8mT+SaN9XhYc6FkgaRz49NHTENV/cYCUIFGKQwHDMSwQ2RqS0z9
	VnTZyRWdJUXs/gHnetr0xMXqMCch+QE8gxFSdGc2sWTQKwCvCif7qzJiyYGBTS42u8TM
	rlg5VByT1Y/Y0/9xqD8STT+/hjlnIe5G1ofdvKZuCyWsHDT64geuMx9X+Cx3JlpHCEUg
	1kJKJyKQ2zLw8QGjGHjGO3Q1nhCO8MBgz1dO/F4e5u/fzOfMywQjEeX3datgHK/IcrZ7
	dLmQ==
Received: by 10.14.202.66 with SMTP id c42mr15855198eeo.35.1347205061179; Sun,
	09 Sep 2012 08:37:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Sun, 9 Sep 2012 08:37:11 -0700 (PDT)
In-Reply-To: <1468786.iJbNk0O7Nh@helios>
References: <1347204678-22970-1-git-send-email-raj.khem@gmail.com>
	<1468786.iJbNk0O7Nh@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Sep 2012 08:37:11 -0700
Message-ID: <CAMKF1spHFqDXtLx72XE5M6ePTVZ3RBD0YGbUpet_Pm0mBjkVEw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-opie][PATCH] recipes: inherit packagegroup instead of obsoleted task bbclass
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
X-List-Received-Date: Sun, 09 Sep 2012 15:50:09 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Sep 9, 2012 at 8:35 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Sunday 09 September 2012 08:31:18 Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  recipes-opie/tasks/task-opie-16mb.bb   |    2 +-
>>  recipes-opie/tasks/task-opie-all.bb    |    2 +-
>>  recipes-opie/tasks/task-opie-apps.bb   |    2 +-
>>  recipes-opie/tasks/task-opie-games.bb  |    2 +-
>>  recipes-opie/tasks/task-opie.bb        |    2 +-
>>  recipes-opie/tasks/task-xqtlauncher.bb |    2 +-
>>  recipes-qtopia/tasks/task-qpe.bb       |    2 +-
>>  7 files changed, 7 insertions(+), 7 deletions(-)
>
> Coincidentally I just pushed my patch series which obsoletes this one. Thanks
> for prompting me to do this earlier though.
>

cool thanks.


> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre


