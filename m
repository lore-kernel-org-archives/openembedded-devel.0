Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1Oog9u-0005K2-56
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 19:22:39 +0200
Received: by ewy7 with SMTP id 7so1489027ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 10:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:cc:content-type;
	bh=nTOdn4uCvawJRdy35ZmOGOIfNy7NURy091IjaFwqYJs=;
	b=FHkgpmjh2pcvmmGhOwz/vauVgplicjd+lo1DUIhVbwgl15rsY2THgcTcd+WJTfmyky
	5xbUT2Hph8/THtkcnCC16DNkrEHEA/rXMqIlpmiR6ZjvsGMV2rZZcKR+yLloXCWNOosX
	TdoKSQ25IrEYKdGJdEwacv0EHzgBnY9t7SubM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	b=VFDIs7r3ct9OCO5PqiDy8/JZD7SHzoZOr8w85Y1zQFU1FaDdz2N6uz8JT2LiU3rASm
	TWn7H2MJU8SfVzmnBcRx3pFK2b1VzwXdq7bHff5FQSvt+0y2ENMxZ/G0N9iZeqm70Z3S
	KukhQ8kei/Yh+/kn8I7L6wymqzOTiQvSOMWKM=
MIME-Version: 1.0
Received: by 10.216.54.202 with SMTP id i52mr9247850wec.40.1282843328961; Thu,
	26 Aug 2010 10:22:08 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Thu, 26 Aug 2010 10:22:07 -0700 (PDT)
Date: Thu, 26 Aug 2010 10:22:07 -0700
Message-ID: <AANLkTim7Z2-z6E+4Duo-s1pvVBK35mWNQE5k7TuEnqvJ@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>
Subject: Question on apr on what it said during build
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
X-List-Received-Date: Thu, 26 Aug 2010 17:22:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

I am building a image and had apr error out while building so I did a
-c clean and rebuilt it which it did fine but, I saw something I had
not noticed before and would like to know if its something to worry
about and if its not what does it mean. The message is below:

NOTE: Running task 749 of 759 (ID: 13,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr_1.3.5.bb,
do_package)
NOTE: the following files were installed but not shipped in any package:
NOTE:   /usr/lib/apr.exp
NOTE:   /usr/share/build-1/mkdir.sh
NOTE:   /usr/share/build-1/apr_rules.mk
NOTE:   /usr/share/build-1/make_var_export.awk
NOTE:   /usr/share/build-1/make_exports.awk


thanks for your help


