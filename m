Return-Path: <eduardo@monkey.io>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8AFF671637
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2015 17:13:45 +0000 (UTC)
Received: by iecat20 with SMTP id at20so15469417iec.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2015 09:13:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=7gzPpDaend8AxlYLwe6EmvuQ10Ia0rckO7FjFSMkSBY=;
	b=Vz6xkpY/SpCvlMbG8nPKmg0WBkKSTI53ltmjTGrpN5KKY5D0TD/BUCjO7DARrnkSQE
	xX3Qcop8ULwCYNyz35gPIX+/s5rQBv2Q+nDV4AGfg8bOZco/bNKV9HIwHy6bv7MUk3C3
	oGDh/EebQmoGsJXDLZzQJFzvIp+0xVgNrKK9e8xk2rdf+yxpIdDurH+P3fZAwcVLrrE/
	W8tuXD9TvWyhOUalHS7uTVx4WgFnYBg38RzQjoKGTxsgEDqNFvHhIsyT7FHrRHfuJjdz
	wENv6eRQFAixFe55VymQPM40vXeoNsr91jGhOq1/Fzwa24WzlL2MNhazGPu+nEviohGr
	ZnaQ==
X-Gm-Message-State: ALoCoQnhE+DYMsJeFVCBE8gnfsjoRlGzb/MTXc6YI6SqACbx9l2ZSA5Y1RaQaDQsqOrmss4dtrnR
MIME-Version: 1.0
X-Received: by 10.50.142.38 with SMTP id rt6mr13194072igb.39.1425489226903;
	Wed, 04 Mar 2015 09:13:46 -0800 (PST)
Received: by 10.107.174.193 with HTTP; Wed, 4 Mar 2015 09:13:46 -0800 (PST)
In-Reply-To: <20150304170859.GJ2337@jama>
References: <1425487808-22201-1-git-send-email-eduardo@monkey.io>
	<20150304170859.GJ2337@jama>
Date: Wed, 4 Mar 2015 11:13:46 -0600
Message-ID: <CAEaCVQi9jGKPwaN04frZc+fn_Y4sNUCLm1g1_TQfHt5nMouDjA@mail.gmail.com>
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-webserver][PATCH] Monkey: new v1.5.6 release.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Mar 2015 17:13:46 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 4, 2015 at 11:08 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Wed, Mar 04, 2015 at 10:50:08AM -0600, Eduardo Silva wrote:
> > This patch add the new Monkey HTTP Server v1.5.6.
> >
> > For more details about software changes please visit:
> >
> >     http://monkey-project.com/Announcements/v1.5.6
> >
> > === Build Tests ==
> >
> >  This version have been tested on Yocto/Daisy based on RPM.
>
> Please test it with master branch as well.
>
>
my mistake on the commit text, it was tested on Dizzy.

