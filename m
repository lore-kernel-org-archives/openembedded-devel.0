Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web10.8531.1586924555618566844
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 21:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HCF5EZJw;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id b12so15701656ion.8
        for <Openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2020 21:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=keMgeZM3kJsJ1cWhxTRm5uw0nLASsNXR4JnZtoWJT+M=;
        b=HCF5EZJwRWNDmwOU67di044nZtXsMOBx5RTPzltoSauieNwb2KKw0ng2E1IG4yPFRM
         z+PHnBPAriXKowTsK+JNlEz/5vfStrLOQlZCEvBBKaFcdlYNlV2OvfHNcDy1FfDa7GeW
         ot9CjtudlpE+clGxpw1AMx5piRXIA6jeUFAwJ5LgndeDILWOQxGElZ8vlgkt8OErVESg
         MjNStCIHwcvXcSZ7kJ7Kpgt476W0t/1eyFs/9CPJ+vOqWg4r2kPbkD7mpKlKBEtK7tG3
         n50rnIzorfN9rO1zZZQO2VAd6eipyQgwYpbf6LKDIKMKl1pNIkSYNUWmmCbwxKSKaAfj
         UQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=keMgeZM3kJsJ1cWhxTRm5uw0nLASsNXR4JnZtoWJT+M=;
        b=gAdFmCMxF++4KoTlhqIzZlBhFNT+Oi38v9RXas742oJU/tGNhvjhT61gFFjQkLSV4S
         MMJb/oYAf08KdaFfFu2hLY6UBNVK/X2g9wZTR6QGHQmj+QyVFBT+AAEqOi/MGv1KA7X/
         GJGiFmEOtS06SlRLqo+/T0INQ2K7yf+fR6zJKrHaijQlCgdADZiPcONjq+mhXTr6kS+v
         2Vg/OMWHUbrB2yjjz+hmUKf9OBXmnkq70ERdnUu9Xfm2ZMVqYem776xlM5O943P274mh
         6IA/StnfiZUhg5TnMMVQRJWsgSZ4YYrNGorlJuSwg92LbfMP6jMpu4fMoP7M+NrL7UL9
         ldmw==
X-Gm-Message-State: AGi0PuY03hurIZm65KFGrU3muoEf0/LGYWc90E3kOvBbjbwmQTNAhHWx
	nMgKumaKraPqzODFiNGvMjUQQAAl+Bd+CRtWTCo7NOC7NUc=
X-Google-Smtp-Source: APiQypLY1HA3+VrQ37+JRHYgJxEYjvMQowdgnrHRssdqjcFFOkEJqyS6FZ+4NxV1fnnQJ5vOO2n535lsa8M9C7dm4XA=
X-Received: by 2002:a02:9445:: with SMTP id a63mr23928975jai.10.1586924554827;
 Tue, 14 Apr 2020 21:22:34 -0700 (PDT)
MIME-Version: 1.0
From: "Tim Orling" <ticotimo@gmail.com>
Date: Tue, 14 Apr 2020 21:22:23 -0700
Message-ID: <CANx9H-AC7H-MDV-CYQ_vu_GN_sm6be-tFdG1rv0qQd5ZAPrvHQ@mail.gmail.com>
Subject: [meta-python2] Final python2 release candidate 2.7.18rc1
To: "openembedded-devel@lists.openembedded.org" <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000060396505a34caadc"

--00000000000060396505a34caadc
Content-Type: text/plain; charset="UTF-8"

Heads up that the final release of python2 has a release candidate:
https://www.python.org/downloads/release/python-2718rc1/

--00000000000060396505a34caadc
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div>Heads up that the final release of python2 has a release candidate:<br></div><div><a href="https://www.python.org/downloads/release/python-2718rc1/">https://www.python.org/downloads/release/python-2718rc1/</a></div></div>

--00000000000060396505a34caadc--
