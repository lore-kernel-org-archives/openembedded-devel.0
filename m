Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9D3D36E362
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 11:44:41 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id i7so1030480oag.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 03:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=t5xmw1rGyqhsrqJNE0Wls87pqOcWmV2jbKuj5N7YUwY=;
	b=MbAaNEPTWt/w74bZOFzSi5SQFNKZJPlfmbqb2o2cz7/MaliWREL5etOH1xGNbhlLqJ
	7Y7H50XMDFnr4mmmoFEMpFSJIYh2GuZIF4oDXj8mUMnKdMlAZspy5utxNVYspGvcr9Bw
	0/FEuXEwuprgcaffKD56RE2jpdvU84mpXfl10jQ5zkXXy1/ftC2Z1Vl8IUb2QwXMrGLz
	BaHAvJZiOn8zeIcV+C10BXjPdN7lW4hD0QGxt2I4ew5Y98Qzn8Nl2KXtNj29FG1c/E+1
	U7xgFgjkXk47oA/h5ZU4dpY+wX1RqLFIWxwPWMMsn885gQdhOXjGZ6cMEMxnI9Kl6MjO
	o3cQ==
MIME-Version: 1.0
X-Received: by 10.182.142.37 with SMTP id rt5mr440236obb.76.1389786282532;
	Wed, 15 Jan 2014 03:44:42 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 15 Jan 2014 03:44:42 -0800 (PST)
In-Reply-To: <1389785832-3120-4-git-send-email-ross.burton@intel.com>
References: <1389785832-3120-1-git-send-email-ross.burton@intel.com>
	<1389785832-3120-4-git-send-email-ross.burton@intel.com>
Date: Wed, 15 Jan 2014 09:44:42 -0200
X-Google-Sender-Auth: TEbr_yAXqWukvD536QHD6POIEx8
Message-ID: <CAP9ODKo9hu0i3tsgwCyCVxCVrz_cVvYnoO7hzt+KwC_M2FD32w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 4/5] libsyncml: don't do out-of-tree builds manually
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
X-List-Received-Date: Wed, 15 Jan 2014 11:44:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 15, 2014 at 9:37 AM, Ross Burton <ross.burton@intel.com> wrote:

> cmake.bbclass as of oe-core 783fb88 defaults to out-of-tree builds.  Use
> that
> functionality instead of passing arguments to EXTRA_OECMAKE and _prepends.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

