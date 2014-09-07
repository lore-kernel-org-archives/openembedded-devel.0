Return-Path: <opensource@keylevel.com>
X-Greylist: delayed 4406 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 07 Sep 2014 22:18:25 UTC
Received: from a180.4uh.net (a180.4uh.net [89.248.60.180])
	by mail.openembedded.org (Postfix) with ESMTP id CBA776FCE0
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Sep 2014 22:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=keylevel.com;
	s=default; 
	h=Mime-Version:To:Date:Message-Id:Subject:Content-Transfer-Encoding:Content-Type:From;
	bh=OgPFNMVzYy+tcBUrocCL3iaSxB+zUyU0o5G8VG9cln8=; 
	b=soWnFQm8znubBpoqhy5veqGuZGLC5cTTfEsf/En+NRiqd2X4OmpGcxQuO5Hmae6U8Ku0fCEGLTPNGYKr+bbc+Yeax+qxOfIDIXoAGKFTzlvYRM/GUmxZJPVIvXQQkUeqFhs8rG7PYF0KxTyifkHBTp6A102QvI8pJekccwGjWCI=;
Received: from [109.224.171.0] (port=22887
	helo=macbook-pro.durham.keylevel.com)
	by a180.4uh.net with esmtpsa (TLSv1:AES128-SHA:128) (Exim 4.82)
	(envelope-from <opensource@keylevel.com>)
	id 1XQjdm-003zBv-8H; Sun, 07 Sep 2014 22:04:56 +0100
From: Chris Tapp <opensource@keylevel.com>
Message-Id: <B62B26F5-EDAA-4783-A21E-936C846A485A@keylevel.com>
Date: Sun, 7 Sep 2014 22:04:55 +0100
To: Yocto Project <yocto@yoctoproject.org>,
	openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
X-Mailer: Apple Mail (2.1878.6)
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - a180.4uh.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - keylevel.com
X-Get-Message-Sender-Via: a180.4uh.net: authenticated_id:
	chris.tapp@keylevel.com
Subject: MuMuDVB DVB network streamer
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
X-List-Received-Date: Sun, 07 Sep 2014 22:18:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

If anyone is looking for a DVB network streamer supporting multicasting =
and unicasting, then I've created a recipe for the MuMuDVB network =
streamer on Github at:

=
https://github.com/keylevel/meta-multimedia/tree/master/recipes-dvb/mumudv=
b

--

Chris Tapp
opensource@keylevel.com
www.keylevel.com





