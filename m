Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TTe8m-0005md-Cb
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 20:39:52 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so1093952pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2012 12:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=pWbXpqlLmQXLiOq7CiZdAAop3mW/WEuTWE0mMhcSrBs=;
	b=ZzARA/WpAESnejd6yFYcKAlEWTQw6CuPyxyYYFiU4x0Qcly+e3EWlHG86X1c5QYVlU
	tyMdi/U80rs7DjYJWpAoj1kOeht0CXsRbYiTWKFmBZG4iv7pMSuKslCFXzHAuAU6hC0f
	LYaB1CD6iwWDgxgr59Akb8cp3AwuH2HMOeFEwNidw2agZ3gAjtoeXQ5Adyl/5kX4wl4d
	ZmS6stJhJd9o0mHkb6W1VSQCY4MKo+IbhfIPnIabs+UNf9GEi6OPy3YXsNmJlWgHM6lx
	ukzdpp6qT80+pzWtN7uvT60JCr9AM7djOv1tpjmV64uBwhT/7zf9txkEVtfRaUtYP+dZ
	QJvg==
MIME-Version: 1.0
Received: by 10.68.213.33 with SMTP id np1mr114996029pbc.64.1351711574718;
	Wed, 31 Oct 2012 12:26:14 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Wed, 31 Oct 2012 12:26:14 -0700 (PDT)
Date: Wed, 31 Oct 2012 17:26:14 -0200
X-Google-Sender-Auth: ObFGcXzVAhiodVg6wWHuGwOFDuw
Message-ID: <CAP9ODKqaFOHjP0RR5xTPi4WP4dX+22uUQW1sdbGS3twD0Bpz=w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Use of meta-systemd and have images using only udev
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
X-List-Received-Date: Wed, 31 Oct 2012 19:39:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I'd like to share the distro among some images; some will use systemd and
others only udev.

I noticed systemd package builds a udev package but it seems not supported
to run standalone. Did someone try it?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

