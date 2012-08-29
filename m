Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T6kQv-0000n6-Q9
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Aug 2012 17:43:57 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 29 Aug 2012 08:31:42 -0700
Received: by obblz20 with SMTP id lz20so1239635obb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2012 08:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=v1UnAOWCDjJlsptDuJVTqHri1Hn0uxATzBW4C7RnAQo=;
	b=lNYbLd5tAOB1N8Gn8xz/cRkEdVMYUsQd+yi9R0H3pNNyFyzOWosP8GcqJh7O+kNhxR
	qy7GV4zKCoXzDpW3fd2UPFWffIQXVP08B3MwgRhwWQg3dS6X8jNvGthcV+9P47wIEsft
	4Us0r0qsL44QVP8Qb0BoyDrqVW4gzaiSwZkm/CRLf7BJSgfMYbpqTSDINzFBsNicuWFt
	fSXQ1km2v7FaDXMimXcU2a483q/xzFq6yyJT3edlaKV3kBVWWnzTZeIEAU1aEUi2vNeb
	tQnOLGuFlW1w3rogUsGbgWUTrl5D6zTSx5gvC0722dwenUB5vNLuk4Wbxkqb9+O4QC9w
	iOUA==
Received: by 10.182.108.71 with SMTP id hi7mr1667193obb.21.1346254301895; Wed,
	29 Aug 2012 08:31:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 29 Aug 2012 08:31:08 -0700 (PDT)
In-Reply-To: <3DA568F2-7691-4344-904C-7DB6FFBF90B9@gmail.com>
References: <1346247150-17236-1-git-send-email-ross.burton@intel.com>
	<3DA568F2-7691-4344-904C-7DB6FFBF90B9@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Aug 2012 16:31:08 +0100
Message-ID: <CAJTo0LYGOrwT1BwB8gDmGwMr67v8Mhtci8MK_QdHm9AW7EeDFA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmjKun7aVg0p14wTcNF14ltW5ygZa4R2RtV18x8nuBTGplJoCc3P/hpjMweIl75u2sX4p7r
Subject: Re: [PATCH] pimlico: remove Poky overrides
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
X-List-Received-Date: Wed, 29 Aug 2012 15:43:58 -0000
Content-Type: text/plain; charset=UTF-8

On 29 August 2012 15:17, Khem Raj <raj.khem@gmail.com> wrote:
> A bit explanation as to why it's done will be nice.
> Why comment out instead delete
> Is this window menu patch needed somewhere else
> If not it must go as well

Thinking about it, I'd like to retract this patch and leave the Poky
distro overrides in that file.  If someone wants dates/contacts/tasks
on Poky then they'll get the extra integration, and it serves as an
example/reminder of the functionality it brings (makes the menu bar a
dropdown from the window title).

Ross


