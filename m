Received: from mail-vb0-f48.google.com ([209.85.212.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UOCia-0008FD-Nc
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Apr 2013 21:54:37 +0200
Received: by mail-vb0-f48.google.com with SMTP id p13so2416377vbe.35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2013 12:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=HZZ1PbMhNJmQ+swKtAZb3MTYta3fXxWAH85eEbEZl98=;
	b=Xtje6JaK5g+/uos7phh3HgX2BWxDHNAW6GoWSfaKIowpo8TaunKIT58Ugt6Vyv660J
	ngKtokQ8h6tzSNpISm/Oop0te7vD5UGfYY8ldgsJnu6pKGLrA1NtDWRA/97sAoP85BDg
	WZ5vrneJy1Q12hiFmUi3XdBZ4rUzWT8aHPW765lVvRDRTIq9tciSD5fKdeGzGI+BnlGx
	8rjRF0Xdgz7Mos1Cs4IqNIX7hv5I69gZ9ZqTVlNSHfNk4mMyjnCN8oU9n9edJykOsUK9
	BWok7VdfcfpuT095H5eBPnLSCfrnqqloDzZsP2VWKQqbbw5as1LH2V5PnGDCSuudBZbr
	SbDQ==
X-Received: by 10.52.158.163 with SMTP id wv3mr7908536vdb.82.1365190641640;
	Fri, 05 Apr 2013 12:37:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Fri, 5 Apr 2013 12:37:01 -0700 (PDT)
In-Reply-To: <CABcZANke4aYfcuuPsQRZMg5Gp5aGwbEqyyQvs_0BSqJHf2H5Dw@mail.gmail.com>
References: <1363859339-12187-1-git-send-email-ross.burton@intel.com>
	<20130321140745.4a0683c8@e6520eb>
	<CABcZANkitD_S70HFXiM+xnC73avzC-2LDjRTcezwVMe1VcW+ow@mail.gmail.com>
	<CAJTo0LaT0TRzCoVqq+-DLpGdcLzjr75Vu7_MivkHov3mUNxq9w@mail.gmail.com>
	<CABcZANke4aYfcuuPsQRZMg5Gp5aGwbEqyyQvs_0BSqJHf2H5Dw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Apr 2013 20:37:01 +0100
Message-ID: <CAJTo0La=91jRUZvskNUtWT7-5zyX8bqVxx55D7h2+uLMcU5tLQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkBDhBK2oKO+NT82C6VoCQksoDsW/OAHNC63rNjoH2oQk1//2Vw0aX1sqwZZ64LUm3ddMs1
Subject: Re: [PATCH][for-danny] guile: remove from meta-oe, there is newer version in oe-core
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
X-List-Received-Date: Fri, 05 Apr 2013 19:54:38 -0000
X-List-Received-Date: Fri, 05 Apr 2013 19:54:38 -0000
Content-Type: text/plain; charset=UTF-8

On 5 April 2013 18:40, Chris Larson <clarson@kergoth.com> wrote:
> Fair enough, but in the future please mention this sort of reasoning in the
> commit messages, or at the very least the patch series emails. Knowing
> *what* a commit does without *why* is much less useful.

Totally agreed and normally I moan at others to do that, so I should
have known better...

Ross


