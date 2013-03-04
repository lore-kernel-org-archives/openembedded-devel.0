Received: from mail-gh0-f181.google.com ([209.85.160.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1UCcRg-0005uZ-Iy
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Mar 2013 21:57:19 +0100
Received: by mail-gh0-f181.google.com with SMTP id y8so879660ghb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Mar 2013 12:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=EDt5lRp0+9N15mt4HveObkwgakhzvs859duzbgiaIa4=;
	b=IeER9ms0xtlWkeaI1Oe86s0tOcC5+C6+mJRksRSqlPuE7ssxq62xEB87YuMA38w4f6
	sEoLFdTW9Kse1a6tyhClBEpLZ9FH0ecHAeer8LOPb1RFjR8FwwlBrKVTnuIrnGgHVIKU
	CVM2G6gVeWO45RVHLnTg1+O/lwM8ZIhJLbp5xigM4aoMWJViuYbYi3o+ITWRrm4jneFI
	3o9GkfeQL05wSZMpJ/XcGfcV0cJ3sgDnmaChfNZyBbHum616+FmgtTgU29BXMI99ufOh
	7GKUGhL4YOVtVCcl9oE+93dpXFDWcTzouw8F11XnL/GIIKQCzMG+HBLgEoWsxJAmIzJ3
	IMkg==
X-Received: by 10.236.154.105 with SMTP id g69mr15083341yhk.179.1362429648060; 
	Mon, 04 Mar 2013 12:40:48 -0800 (PST)
Received: from bill-the-cat (cpe-065-184-250-089.ec.res.rr.com.
	[65.184.250.89])
	by mx.google.com with ESMTPS id v43sm2670434yhm.11.2013.03.04.12.40.45
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 12:40:46 -0800 (PST)
Date: Mon, 4 Mar 2013 15:40:55 -0500
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130304204055.GC25797@bill-the-cat>
References: <cover.1362223895.git.apelete@seketeli.net>
MIME-Version: 1.0
In-Reply-To: <cover.1362223895.git.apelete@seketeli.net>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [2011.03-maintenance][PATCH 0/7] Pull request 20130302
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
X-List-Received-Date: Mon, 04 Mar 2013 20:57:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 02, 2013 at 12:55:52PM +0100, Apelete Seketeli wrote:

> Hello,
> 
> The patches that come as a follow-up of this message fix issues found
> while building muffinman-image on top of the 2011.03-maintenance
> branch, and also add the capability to build a ubi image for the
> ben-nanonote machine. This work is intended to be used as a basis for
> porting the JLime distribution to oe-core.
> 
> These modifications were tested by successfully building
> muffinman-image from scratch on a Debian Wheezy host.
> Please pull into 2011.03-maintenance branch.

In addition to the changes requested, please make sure to CC me on the
v2 so that gmail marks this as important.  Thanks!

-- 
Tom


