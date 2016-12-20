Return-Path: <ka6sox@gmail.com>
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
	[209.85.161.180])
	by mail.openembedded.org (Postfix) with ESMTP id 26E8677338
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 18:50:00 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id r204so86675537ywb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 10:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=BcH/EmUmfmirkK98jKjfnGP7B0lZ1HPoKaQDaq8nbyY=;
	b=gAM3SJ3yi4jj443jrSGlO22A8H+7r4bA+k1k3MFzYKoVJaJ/nZiWtDrFvkMVzkqxlw
	CcYPe1W/F8P3fsKSMdbsa0pZAGmCW4RTPIfa/gUlP29s4GCm0U3v9hQVxfimpJdi2DYd
	z1KVT3uv7ackNO8zsg+nXGUpazmMSKt2meUt5V7mPGDwdIDD+z9XgNLUUWjhk/w+kWPX
	lvBfkJbRQMCU5oHWNAMgpwVgbTj2M6BlEvAFj94Czgu/mqvACV23oiIaC8tBljp7wpyv
	3I7e6KwPXTIfd3bSzjzYA0gjeCXWWoIr4pOTzt012rP9UM8wh1qjMO05mzCByqvAH6Pm
	nSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=BcH/EmUmfmirkK98jKjfnGP7B0lZ1HPoKaQDaq8nbyY=;
	b=bk9sJQzvMp5FtqDZAsv+1Xc+K0Ya0kuH+1oYdR6NuK+S6vxZdkOU6SUYA5jtg76LfG
	yaaNixB3cYikYFXTpf8SjWMInBgWNDc1NiMvfJuhh0tgxdtTxhf1Jp7FGcQzBOHcaRnQ
	/8b6O5dL8e5QPWKf1bCWvlGhe368IrwYpLvNUwxDcFJ2K3GohN15YJyqGlcIoULswzt0
	HHTxOlwDqFwfBKk6ypYZaJNH2dtuZrPdUd9Kr7YM2UiVeFTancWpdMs5YYYb1RN/xeGf
	ie7iyqDkwmP+99YgX/YitKcClecYI1eoa151aBkJKm38fSOgAsGM18l/c3Z5sUNMSmYm
	ARXg==
X-Gm-Message-State: AIkVDXKaX3bvoVSuGruKWjDsromhSCmNyV+KuQMD257NCT0nY43fVN6gPUcXOY3/1+eQdnuN9OqNNHjIbGnGJw==
X-Received: by 10.13.192.133 with SMTP id b127mr693214ywd.116.1482259801542;
	Tue, 20 Dec 2016 10:50:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.170.43 with HTTP; Tue, 20 Dec 2016 10:50:01 -0800 (PST)
From: Tom King <ka6sox@gmail.com>
Date: Tue, 20 Dec 2016 10:50:01 -0800
Message-ID: <CAHQecY48gVbt4S+88MHivSbv-Xdn29WRq5RPL6+QDVGYUPCwYw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Infra Full Stop 12/26-12/29
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Dec 2016 18:50:01 -0000
Content-Type: text/plain; charset=UTF-8

Hi All,

We have been looking for a time when we could do a full stop of the infra
to upgrade some bits and clear out some faults.

This will involve shutting down the main machine that we use for *most* of
the OE infra.

Our goal is to put up a backup git master but other services such as: wiki,
patches, etc will be offline for some or all of that period.

We have delayed doing this much needed maintenance to try to work around
Yocto and OE release schedules and it is necessary that we take this time
to do the work.

Tom
(for the OE Infra Team)

