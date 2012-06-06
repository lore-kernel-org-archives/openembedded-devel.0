Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1ScHJ4-0000yY-Tk
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jun 2012 16:33:57 +0200
Received: by yhjj56 with SMTP id j56so4892957yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2012 07:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=xLMAoHQW1gsh0h+ksqiR6EkmYD19Nn1AvsO84/lesIY=;
	b=uvXuRLwYVz/NqNkQ4eZvxp8ByDSC7q8FP8uj8gqLEVEfbRYhu2LUGCZ8PJcr3aLyMz
	G8GSixthAhetqj8kXfqvGcambhCcyQRaR1EhJVJurauL8EhY4ncv6Qz3dBOs1gxAZdJl
	I6/ahPgvEeBUE2q4Q9ApApnrb1v7krhl39wdnSc5J7tcENX92Gk9+DS8olZJQGxFDP7m
	puaq3pO0BVskkerctNfbr6Pwlh4dqQ2phUI8K7B5IxeSr64ge1pDWPbL1KgQg/7wu8c/
	KdYtals9HU+SRlXwOvaNp9Rz94q76fJlKf/u5R4MCYFCxcDJiZK+jDKQvHbasDPW2aHW
	dbmQ==
MIME-Version: 1.0
Received: by 10.50.203.39 with SMTP id kn7mr6649020igc.53.1338992606608; Wed,
	06 Jun 2012 07:23:26 -0700 (PDT)
Received: by 10.64.18.10 with HTTP; Wed, 6 Jun 2012 07:23:26 -0700 (PDT)
Date: Wed, 6 Jun 2012 16:23:26 +0200
Message-ID: <CALbNGRSJhn0wNvYd_ggvAgbvY6fwXLyuYS3t_GRBi4Gm4_+5Eg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: libjpeg8_8d instead of libjpeg-turbo installed
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
X-List-Received-Date: Wed, 06 Jun 2012 14:33:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi

does anybody know why libjpeg8_8d instead of libjpeg-turbo is
installed on my image although Angstrom says

PREFERRED_PROVIDER_jpeg = "libjpeg-turbo"
PREFERRED_PROVIDER_jpeg-native = "libjpeg-turbo-native"

Andreas


