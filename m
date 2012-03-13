Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1S7W1t-0005MF-RA
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Mar 2012 19:01:02 +0100
Received: by iaag37 with SMTP id g37so1032387iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2012 10:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=RWp/mFAF2HHGYJpgt90eaYuwk3Uhr0NFtA7lRmDfYas=;
	b=pX9acwSKE6txs9j4TQTy9PoSj31ZiWsIS/nntmUsbUdTRSbltcv746G6Bc7TVl/zn8
	dbdRvtMYhB4LcoxHif3fppHWZdHdbxhyYjr3trLbHgkfIV8s2tyPoJOTMxUwaghf4WkW
	+M6q6BT+15zDXrO2e95Ti4IWt7CH48qs6fW4pA/ySYJZzmG4vMnfdGrTrYnU4EdhQPP3
	PhmerXCw8DaidWXqA/HjpFm0b4hJum8Op5QdLhR08egq9gaR+IF/9YAVgrsOV4BzUpsN
	cWiEp23Lk+KunvO+h6ZgOH0VuUU+daYZeYqU/q0wMhgQ88FkkcdvD2Dj+PlfQlZEae3f
	ZW8Q==
Received: by 10.50.156.229 with SMTP id wh5mr6402947igb.28.1331661137049;
	Tue, 13 Mar 2012 10:52:17 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id wp4sm10784069igc.3.2012.03.13.10.52.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Mar 2012 10:52:16 -0700 (PDT)
Date: Tue, 13 Mar 2012 10:52:23 -0700
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120313175223.GB12674@bill-the-cat>
References: <1331472732-28668-1-git-send-email-fransmeulenbroeks@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1331472732-28668-1-git-send-email-fransmeulenbroeks@gmail.com>
Organization: Texas Instruments
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [2011.03-maintenance] [PATCH 1/2] tzcode/tzdata: moved to 2012b; changed src location
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
X-List-Received-Date: Tue, 13 Mar 2012 18:01:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 11, 2012 at 02:32:11PM +0100, Frans Meulenbroeks wrote:

> elsie does not respond, so moved to ftp.iana.org (also used by oe-core)

A quick check and I see that ftp.iana.org does NOT delete old versions
so we can finally fix that problem too.  Please rework to use the new
URL but not to change versions.  Thanks!

-- 
Tom


