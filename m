Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1ReuYS-0002kA-Ls
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Dec 2011 21:20:25 +0100
Received: by vcbf1 with SMTP id f1so7695190vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Dec 2011 12:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=jiL2UZNOo5YkLySuAMNGKEykyuoHWtgpFOabfa9Kvbg=;
	b=xfP7VUoNvWVKcjUBEpkLSbj1gAu7vLdzFe6UX4jPk3PdDq/ecvAREVw+LONVnHQ8SL
	V15IYofV29CgSkI4ZzV7iwD0QZ7LfnTMIWasOHnWFvciiujtk8436+C688qoYtHMSilS
	9zSn5pTxSGbdyCgQLQDK0UncTvlOH+vlXi/tY=
MIME-Version: 1.0
Received: by 10.220.232.68 with SMTP id jt4mr13058690vcb.65.1324843993341;
	Sun, 25 Dec 2011 12:13:13 -0800 (PST)
Received: by 10.52.160.137 with HTTP; Sun, 25 Dec 2011 12:13:13 -0800 (PST)
Date: Sun, 25 Dec 2011 21:13:13 +0100
Message-ID: <CACW_hTaKsEMpgRKRPz6uhgGkdm+qNf=hJoH9Db7ds6YbR6g8_A@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: opkg-util does not fetch any more
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
X-List-Received-Date: Sun, 25 Dec 2011 20:20:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

opkg-util does not fetch any more. The svn at openmoko does not seem to
exist any more.
This is a problem with oe classic (master and 2011.03-maintenance) as well
as oe-core (bug filed for that one).

Frans

