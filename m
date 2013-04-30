Received: from mail-vb0-f48.google.com ([209.85.212.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UX7A4-0007JI-Nu
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 11:47:54 +0200
Received: by mail-vb0-f48.google.com with SMTP id p12so223229vbe.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2013 02:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=XIY4oxSQwwj0dsE3kdyb7+R/q0/anUtA7MmNu1UweBE=;
	b=Ayg35uPHyjlBpiIAv7KbXBPXSAYBMhx6aml10ZAdmblzkzkuA/jTup7ld9AyU9VZy0
	3HsEK+4s8sGWsAoe/rr6+tOZoI40tw6sklI8ZGJ5XdMhL/rIjrYAOmEvJ2d15O2AcYjL
	Xz1i98AU1tZA3dTbi2d/tffEE6daNFKuLiS13n5siO9OWtI718oIhBR5l4qbIrkB5MgX
	HLY9FEi7Ac9dGj26rh1+cZwco79olqTqtmMkb7hPDFI+2YRqWNPxngDTMjTwMbpdzJvT
	o4ZB+DZrQlR3XfPPZBstImLrhlSeCf3f5UGsMhtvhVgHeSAwfG4YVVPezfEIoibZ2KXI
	H/bA==
X-Received: by 10.220.78.131 with SMTP id l3mr2651494vck.54.1367314190007;
	Tue, 30 Apr 2013 02:29:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Tue, 30 Apr 2013 02:29:29 -0700 (PDT)
In-Reply-To: <ABE1F3FA-9C6C-4B22-88CB-860E6311BD13@dominion.thruhere.net>
References: <CALbNGRRndfF8dvQhtnSgzcE-72KGOP4tb5BQx_Z-205Dr2prGw@mail.gmail.com>
	<ABE1F3FA-9C6C-4B22-88CB-860E6311BD13@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Apr 2013 10:29:29 +0100
Message-ID: <CAJTo0LYL=ZkYEiGvot9xzDcsvFpAOZhecakt3ekYejqis1rqQA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmGIGEcxbOUCqvFUT/Q0yMMdWNfbJBXKaVTJMjllTTrZGp7AyFEzVcr2UcaYStlkxT7mAZx
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] udev-extraconf conflicts
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
X-List-Received-Date: Tue, 30 Apr 2013 09:47:59 -0000
Content-Type: text/plain; charset=UTF-8

On 30 April 2013 10:11, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Indeed, it's fun to see the flurry of patches trying to fix things up for 'xuser'. I'm fond of the saying "If you find yourself in a hole, stop digging".

Agreed, anything that involves *more* knowledge of xuser beyond the X
startup script is Very Bad Indeed.

Ross


