Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PiDIr-0007Ma-98
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 22:53:25 +0100
Received: by iyj18 with SMTP id 18so871311iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 13:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=FXEz/B2v+q4nkstd4l25iu7nPOwxwNb2G6HYdLyDQkI=;
	b=VqGaVgBWHQLgiDDzMBKELWRIag3gsdgudsQJZtkyMqId3puC2AfnJodJHFm2xHDFoL
	JBPSgM8pZWNzABjf+UE4Y8npUN4Zjmz8uPsKAsfKdpKASQkvmd79ProIQqjhC8j0A5sH
	gTg1xKqrZiTm3oyqBtZtei4Jn26wrZ/XQYfic=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Z/Mex1ksR3e1MG4Zd9CKrM2qQuy97e27UWHMAgLRadFXpl7oT98wDcfGhTxYCNLhwu
	eDnJ72OPpdPRyVU8jWeqctfZFuz4nuEnttfiwgha+z/8S0kS2sOQHz21mZX2Etb//viM
	+7ZPoKVIAk138BKGempE3EXWCL8yaQ4Iestx4=
MIME-Version: 1.0
Received: by 10.231.207.66 with SMTP id fx2mr8920149ibb.108.1296078756697;
	Wed, 26 Jan 2011 13:52:36 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Wed, 26 Jan 2011 13:52:36 -0800 (PST)
Date: Wed, 26 Jan 2011 22:52:36 +0100
Message-ID: <AANLkTi=L4=feV011DQf0Nm0RUnrWT6EABbymCi=Uq-o9@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: cups QA issue
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
X-List-Received-Date: Wed, 26 Jan 2011 21:53:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I got this while building cups, but I am not a gnome person (actually
I am only intterested in the server part).

ERROR: QA Issue with cups:
/home/hudson/jobs/FM_TEST/workspace/tmp/work/ppce500v2-oe-linux-gnuspe/cups-1.2.12-r7.2/packages-split/cups/usr/share/applications/cups.desktop:
warning: value "Application;System;X-Red-Hat-Base;" for key
"Categories" in group "Desktop Entry" contains a deprecated value
"Application"
ERROR: QA Issue with cups:
/home/hudson/jobs/FM_TEST/workspace/tmp/work/ppce500v2-oe-linux-gnuspe/cups-1.2.12-r7.2/packages-split/cups/usr/share/applications/cups.desktop:
warning: key "Encoding" in group "Desktop Entry" is deprecated
ERROR: QA Issue with cups:
/home/hudson/jobs/FM_TEST/workspace/tmp/work/ppce500v2-oe-linux-gnuspe/cups-1.2.12-r7.2/packages-split/cups/usr/share/applications/cups.desktop:
warning: value "" for key "Path" in group "Desktop Entry" does not
look like an absolute path
ERROR: QA Issue with cups:
/home/hudson/jobs/FM_TEST/workspace/tmp/work/ppce500v2-oe-linux-gnuspe/cups-1.2.12-r7.2/packages-split/cups/usr/share/applications/cups.desktop:
warning: key "TerminalOptions" in group "Desktop Entry" is deprecated

Anyone care to fix this or provide a suggestion on how to fix ?

Thanks, Frans


