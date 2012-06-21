Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Shlv4-0005X5-Ma for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2012 20:15:50 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Shlkd-00032Y-Cc for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2012 20:05:03 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 20:05:03 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 20:05:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 21 Jun 2012 20:00:56 +0200
Message-ID: <jrvngo$vv$2@dough.gmane.org>
References: <1339364820-2880-23-git-send-email-schnitzeltony@googlemail.com>
	<1340264126-29651-1-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <1340264126-29651-1-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.4.1
Subject: Re: [RFC, meta-oe 22/27 v2] xserver-nodm-init: move systemd support to meta-systemd
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
X-List-Received-Date: Thu, 21 Jun 2012 18:15:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 21-06-12 09:35, Martin Jansa schreef:
> From: Andreas Müller <schnitzeltony@googlemail.com>
> 
> contents of ${sysconfdir}/default/xserver-nodm were moved from 
> FILES_${PN}-systemd to FILES_${PN}
> 
> 
> ---
> 
> v2: xserver-nodm.conf was moved to meta-systemd and kept in ${PN}-systemd
> where it belongs
> 
> 
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Will git pick these SOBs up below the comment mark?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJP42FYAAoJEHZqAkdh1vT6PksQAIPwAaXH8m3161uikHBUkAvv
E+mNYZtvbSW+7j3Yr3LYJIC/AGgM+i1DcA64Ng5U8bVNdyH0vAKihMe8SGZqMO2K
+mSflKSznvF7PwHJVwzsgGMhfqd95hCS8oyO/U91FeQnIBsAfivv1VBMbc0dgaic
ZjFD9+7M2FSnIWwrAKellIG3fZQAuk6VmNB7wgvxE5e11R6tYYYvZ1lywB34cHLY
5vr7rzwBeIu+hrBF56o0qD+7JYtDY/oa3NA3IAvRz4g88CPotQSDtOhvobhmzthd
otKJAmSbx31pBM3/+IncO19M7bxjk1AxPBgFVa+ZFFLtK8ZLfgYggBJ8zbrzhrW7
7pIh26hztbjTs9Ey3tDzF3rNWQcv+AxRFJ33FvEvWIy+n6M+olfTHeRD2yl9Oru5
yYuudeB+m+gvJE0r9PvKKsHBvgEoqjrW2d57VpTposnGkYFsgwIoSUMPFr7cMQJD
zinb+mbfakZVnWgvHDxp9rotMslDtmg6kmJG54Y6oYEkQuMoTZaefOZsEUSO7CDJ
4ADRBP3a3jn/cTvSwNSM5F35D8K7JljjOtsjjG9FYm3j3b1c6c2T2DYDPKhfvj+e
yCPr5OXO6FbVRLWFmEh3MhxQZRqnu+ueoiFXW0LRPVRdTCyueTr16mWnE9etKFty
WdHLCUCK34fXL9/J0ndj
=jZhK
-----END PGP SIGNATURE-----



