Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 51BEA7732B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 10:44:52 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id k200so8485380itb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 02:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=465VQe5oZhGuPgaBO3IvjnegoUaKTPdx9IvoJPvSR5E=;
	b=Mz6ZIqnKE+SEP8/i3jmJF0SOo1Rjcb2zkc9S0m3T5+nRRWh0q3VlZv4o5f5mhS3hXH
	0zoIyU/wP+xJ6NpD5jdqOrTVIQaxbyF2PBCnGEfrwBcRBPOAoSfFS465oe0FmeN+ygjA
	GhnQZeJfrDm7v25h8KiKhuDJwt28QE+iAMK7mv70xIPz2H4ItJDYtJ0dDfbY+j8MC0FO
	c7ApvPmpJxXOV1RvTpfTdBafCR/A189Ma8PJb3sXRCnHhMALjvNPQ3WS5pV4g3BTDT3A
	Xzaa+/LXDQFcpR1e0XMMEyABq9md01kzoOXj5CkJEwyfjoXUvmYvAkM7swDwLLJXvM3N
	hfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=465VQe5oZhGuPgaBO3IvjnegoUaKTPdx9IvoJPvSR5E=;
	b=M27M9PyyVh5N7ucoZfakR3N+T/xrGOZ30KX1eo3Pi+av3z1vDPuNAOu7GagUz+NCtf
	jD/spzgw/S7oTiXDTAt+Q/phnr4noioulIVnFWLbJufQnFjbVLSmlHTuu8oD8RI9h8Uo
	h3LkiZvsmmSHwkw6MkRqB396cBSnPIGT0B7OSTApWicGs0ydL3vKPrBTEwVgop0e8RIE
	LMFHb/zYCPDQIg0etsz/k2TZXhc41cpHUMsYWftZH5MUzWsmtptPEFqJbvTXlC6GRSxv
	+TYDrdp59dozAaMkNcoph9wbvL+0F++QCwTHfxlFM/MW2+k5s+W74A/a9rn0SfzX58vE
	fmCQ==
X-Gm-Message-State: AIkVDXLWyH1sq44iNLlF8pEtkTfDfqj25Y95BOQQHtGFG6KXfdkovRUYfHwPvBex7VGejgOL
X-Received: by 10.36.175.23 with SMTP id t23mr2439714ite.18.1485513893062;
	Fri, 27 Jan 2017 02:44:53 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DB2E.dip0.t-ipconnect.de. [93.232.219.46])
	by smtp.gmail.com with ESMTPSA id k66sm1200025itg.8.2017.01.27.02.44.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jan 2017 02:44:51 -0800 (PST)
Message-ID: <1485513889.20333.102.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jan 2017 11:44:49 +0100
In-Reply-To: <20170127101200.25785-1-patrick.ohly@intel.com>
References: <20170127101200.25785-1-patrick.ohly@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [PATCH] multipath-tools: update to 0.6.4
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
X-List-Received-Date: Fri, 27 Jan 2017 10:44:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-01-27 at 11:11 +0100, Patrick Ohly wrote:
> No particular reason for updating besides following upstream.

Please ignore. It's a duplicate of the same patch from the patch series.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




