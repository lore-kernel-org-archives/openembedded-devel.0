Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id E65016EEFA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 12:07:05 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id i13so244809qae.41
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 04:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/DSlO31E4qoBGTgeFim7oiEnqV9aclOMUquJ+AZo0FU=;
	b=MWr1FpORicFjXBZ3y784bldhY65CDL2qylbfgap/6p/NtUWNIFZveurZokWJ0j7TXA
	iNlpHeueyh/uynE0R6gSWGf0t8tT+e2AH10yx54ooYAJTG4IOiWR7ttxvZJ8ltDSKeGU
	ikwbvBZrZ77+pzRDPt0zxXDxC1Qn+AZQ/VjfdB2gk3J5IJoKGJoM0GGmE4zolsrIFBVj
	xF1twAWIrDZN/XmKSXi+Uassj+7hDdiiRk1Q+0v6vuyQOCtlNfSFw/DrnG5VpQUAXhqJ
	BTah1UI3lbLoYiZwKWCIKpYKbTcuylMU5hJ38sSpdfQ0APhxnXGAzIHis5UJDTUuiwFm
	viJw==
X-Received: by 10.140.106.225 with SMTP id e88mr34966210qgf.66.1393330026104; 
	Tue, 25 Feb 2014 04:07:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Tue, 25 Feb 2014 04:06:46 -0800 (PST)
In-Reply-To: <3829871.fcosCAaezP@peggleto-mobl5.ger.corp.intel.com>
References: <CAMCfZKHGAHVN0e9PkAQw5x98OeSOgHVXxZwNzdJZB1YxxOv1tg@mail.gmail.com>
	<3829871.fcosCAaezP@peggleto-mobl5.ger.corp.intel.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 25 Feb 2014 09:06:46 -0300
Message-ID: <CAMCfZKFJX392DbWg9Sx2EEGha_9i--nRYYuvi=KxiAp6+_r_pw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: New recipes and recipes from oe-classic
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
X-List-Received-Date: Tue, 25 Feb 2014 12:07:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 24, 2014 at 9:15 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> I don't know if there really are policies, other than:
>
> * Find a layer where the recipe fits in; or, if the recipe fits into a new
> category and there are likely to be others added soon that will also fit
> into
> it, create a new layer; otherwise, add it to meta-oe.
>
> * Note in the commit message that the recipe is being migrated over from
> OE-
> Classic.
>
> As far as the migration goes please refer to the following wiki page:
>
>   http://www.openembedded.org/wiki/Migrating_metadata_to_OE-Core
>
> Hope this helps.
>

Thanks Paul.

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

