Received: from mail-vb0-f41.google.com ([209.85.212.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TtmDW-00058N-JM
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jan 2013 22:32:46 +0100
Received: by mail-vb0-f41.google.com with SMTP id l22so1925280vbn.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2013 13:17:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=l+OAmDLeCtZeW6kJZJ1x3pY4Kryicnk4JcYhdM9LwzQ=;
	b=fFXXwFPGesFBdH0i+tUOGaLX8xfNPOq9x7wZqPQD8hjE+wma5DU1dup8b7mZPA9WU6
	lFcM3hrV7JatbI78nXN18PLyzz/8L2+rTJr2ogn9oSFcugOvWSLaiOpyoYaP7RMiV8PT
	S8zLemRRFWoD6OGJWAo24JXNjPylEZuJKCi/7HkwZl+AqQ1D5gT8xNYJHd7JUfbJ87rx
	EwkZoOj7esuupOohCac1RnSs+XQbWZ7uoPkf155QLmAZydcEfY5lY/kWzwRtE8Qm8FHt
	HnTNKPtA17D2wCy5n1YTlSQcEP9TBPeF8mFy5lxN6vf3RIpGR5MBKNI6H9mJ8FAcSiI+
	7eWg==
Received: by 10.220.247.136 with SMTP id mc8mr17037156vcb.44.1357939050974;
	Fri, 11 Jan 2013 13:17:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.102.132 with HTTP; Fri, 11 Jan 2013 13:17:10 -0800 (PST)
X-Originating-IP: [5.13.223.33]
In-Reply-To: <50F07D19.1010107@balister.org>
References: <1357936861-8245-1-git-send-email-philip@balister.org>
	<CAK18fxENpqFbRG9fOdLVB5_o+A+E1zvDjZZCzwXv61wao9KT_A@mail.gmail.com>
	<50F07D19.1010107@balister.org>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 11 Jan 2013 23:17:10 +0200
Message-ID: <CAK18fxH3BsAuADgA-rO06ecnic=bA2i_cU+3yhBd8M3Ey_DyOw@mail.gmail.com>
To: Philip Balister <philip@balister.org>
X-Gm-Message-State: ALoCoQnCPElDL9cJLkV2f8FHtRb36F+O1WHnKdoLeW7MC86h6zQln1nKbbmeg6GAUpY6i4yO7euA
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] uhd-firmware : Update to version 3.5.0.
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
X-List-Received-Date: Fri, 11 Jan 2013 21:32:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 11, 2013 at 10:59 PM, Philip Balister <philip@balister.org>wrote:

> On 01/11/2013 03:49 PM, Andrei Gherzan wrote:
> > Send emails with -M flag please. Thanks.
>
> Should always use the -M flag? If so, I'll submit a patch to change the
> command shown in the README file.
>
>
Only when renaming files.

ag

