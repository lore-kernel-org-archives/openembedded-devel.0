Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdOBP-0004P6-1L
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 17:38:52 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so4817958eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 08:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HQbMpOqMA+k8nDdRPDfZyWUVAJOtrg0fd+zClzxTPFM=;
	b=taxmEOG5QWNoaqe1qY85yEHtDkGjTob/2HjOqzvzJzm7e98ey6PCuAZEXaAQ1HbqK2
	Mjp12WEEovkP9jnnFplAjgjEJD116mjQehXcVktU29UpwTYHsjiWDeZ4XG4ceVeuaexL
	cH+GoBxeIrNcvU53fM8bcjVPh+SEiSzdjQfPfhrdZ+oqNbw3y4oZDfGiwOfEG1YR9aru
	YVj09VB8STMkGrIIo9x3p/y2+SecHVUp8W5zAv62b8kmrEVGdpOc/ctzJLGlVnT3MplW
	mGm97oMy77YMzUecKGHgKf2o7YHXIveZGjJcwB5TWv8k3l96X8chFof7clKTw8N5K6JM
	uCBw==
Received: by 10.14.223.135 with SMTP id v7mr59767598eep.41.1354033477900;
	Tue, 27 Nov 2012 08:24:37 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e7sm41566795eep.1.2012.11.27.08.24.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 08:24:37 -0800 (PST)
Date: Tue, 27 Nov 2012 17:24:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121127162432.GD3692@jama.jama.net>
References: <1353937823-29509-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1353937823-29509-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] meta-oe: remove guile, it's in oe-core now
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
X-List-Received-Date: Tue, 27 Nov 2012 16:38:52 -0000
X-Groupsio-MsgNum: 41752
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ALfTUftag+2gvp1h"
Content-Disposition: inline

--ALfTUftag+2gvp1h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 26, 2012 at 01:50:23PM +0000, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Hi,

meta-oe should be [meta-oe] and subject should start with guile:

Cheers,

--ALfTUftag+2gvp1h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC06UAACgkQN1Ujt2V2gBy6KwCgsZ4y6uNoWG6DF0flV3MMeHt4
wWUAn1pmliUc51MSurESArlSa5SODkWe
=jRbo
-----END PGP SIGNATURE-----

--ALfTUftag+2gvp1h--
