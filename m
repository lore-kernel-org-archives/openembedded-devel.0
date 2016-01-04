Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 18541731C1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:53:15 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id p186so46787961qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 02:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent;
	bh=+AzB1FzKnMW4Z+SIv7KOY/nx1A5ni8lERhGsKa4abfY=;
	b=bUZm4XeQWpG6POnXkoBgx5qaJSWhQ8/nsEvzGBoi9X3+oXCnfkGPQeUXTKNkx8fw5H
	A+UA3FklzW+8SD+vr4mABRVCPT462dmyFWsJOvt3dbJzEyZeIPCi18az0DwwwUkpJ0sN
	qr4gZXMidoRSFXH3kjoKBYJEQ+6C75a/grliITNoU8sjtS+l8tKMW7sS9U8QiJp9GpcK
	xNgdEfLExC750da6eWqeMFHHLsjmONHUtxktg1e4Cg3zv8PXEMytMnVQJfm2uWQA1kPg
	30hByJj6nhRY8WZdmU0n2Ufz+D9RiUyLz3pxKF+EgrYU+Y/5tQcag4F+fRPeOMKQwhwA
	l6BA==
X-Received: by 10.55.42.224 with SMTP id q93mr8149080qkq.33.1451904795812;
	Mon, 04 Jan 2016 02:53:15 -0800 (PST)
Received: from localhost ([177.127.6.55]) by smtp.gmail.com with ESMTPSA id
	c190sm39924963qkb.27.2016.01.04.02.53.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jan 2016 02:53:14 -0800 (PST)
Message-ID: <568a4f1a.c74e370a.b7ae0.ffffb09b@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Mon, 04 Jan 2016 08:53:10 -0200
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Mon, 04 Jan 2016 08:53:10 -0200
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.5
Subject: Updates to meta-browser (master) in 2016-01-04
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
X-List-Received-Date: Mon, 04 Jan 2016 10:53:16 -0000

Hello,

I pushed following updates:

commit 8f19ca90ebad060c986971330c1368353f113aa2 (HEAD -> pending, origin/master, origin/HEAD)
Author: Trevor Woerner <twoerner@gmail.com>
Date:   Fri Jan 1 14:45:09 2016 -0500

    chromium_40.0.2214.91.bb: improve PACKAGECONFIG info
    
    Improve the visual appearance of the PACKAGECONFIG options by adding a title
    to the PACKAGECONFIG option section, wrapping lines to 80 columns, aligning
    the left justification for subsequent lines, moving the default settings for
    each option to a more prominent location, and moving all the items affected by
    PACKAGECONFIG options to be closer to where these options are listed and
    explained.
    
    Signed-off-by: Trevor Woerner <twoerner@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 24c18b3f2b9120cbe85fe2b51d2507e8476b3db8
Author: Trevor Woerner <twoerner@gmail.com>
Date:   Fri Jan 1 14:45:08 2016 -0500

    chromium.inc: fix typos
    
    The gl PACKAGECONFIG is "use-egl", not "use-gl".
    
    Adjust comment to include a space after initial comment delimiter (#). Close
    parenthesis at end of comment.
    
    Signed-off-by: Trevor Woerner <twoerner@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

