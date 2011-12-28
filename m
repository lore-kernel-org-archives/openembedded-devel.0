Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1Rfvmc-00072l-Vb
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Dec 2011 16:51:15 +0100
Received: by iakh37 with SMTP id h37so18592240iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2011 07:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=6AaMPs6JHLY+wUa1bHNNDt9VpSvathJWsD2929+ZlFc=;
	b=wNX8UVU6GxirPHAh0pq9N4SWuG8Kwm05KvHsPOAO+OsgczMurehPYHrbsE6TyIc59+
	5+0Fcw/koWmAPz983oovcRuM0aLsiWYK88tmD+l+QUUG27I9VNid1th+iYuUkMOETG9q
	QLPor1vWtSAgKXfCPPBQAsn3GpnNK5SU05kXM=
MIME-Version: 1.0
Received: by 10.50.155.195 with SMTP id vy3mr36307054igb.12.1325087035826;
	Wed, 28 Dec 2011 07:43:55 -0800 (PST)
Received: by 10.231.3.70 with HTTP; Wed, 28 Dec 2011 07:43:55 -0800 (PST)
Date: Wed, 28 Dec 2011 16:43:55 +0100
Message-ID: <CAOHjBZuETnOuVQkfC9hmoS9X8vRVQCnLUPtqF6g5+JLjT4+DQA@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Python2.7.2 compatibility
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
X-List-Received-Date: Wed, 28 Dec 2011 15:51:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I moved to two VM (Fedora16 and Ubuntu11.10). Both have python2.7.2
I have problem using bitbake against this python version.
Is this a known problem or I'm missing something?
I had this problem with both best so far bitbake (git clone) and previous
stable versions.

Please let me know.
Thanks and Regards,
Giuseppe

